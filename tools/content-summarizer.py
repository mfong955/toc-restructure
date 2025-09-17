#!/usr/bin/env python3
"""
Content Summarizer for ToC Analysis

Processes XML content files to generate page summaries and categorization
for content audit and restructuring.

Usage:
    python content-summarizer.py --content-path [PATH] --csv-file [CSV_FILE]
"""

import argparse
import csv
import os
import re
import xml.etree.ElementTree as ET
from pathlib import Path
from typing import Dict, List, Optional, Tuple

class ContentSummarizer:
    def __init__(self, content_path: str, csv_file: str):
        self.content_path = Path(content_path)
        self.csv_file = Path(csv_file)
        self.max_lines = 100  # Maximum lines to process per section
        
    def validate_inputs(self) -> bool:
        """Validate input files and paths exist."""
        if not self.csv_file.exists():
            print(f"Error: CSV file not found: {self.csv_file}")
            print("Please run toc-extractor.sh first to generate the CSV file.")
            return False
            
        if not self.content_path.exists():
            print(f"Error: Content path not found: {self.content_path}")
            return False
            
        return True
    
    def find_section_content(self, section_id: str) -> Optional[str]:
        """Find and extract content for a given section ID."""
        # Remove .html extension if present
        clean_id = section_id.replace('.html', '')
        
        # Search for XML files containing the section
        xml_files = list(self.content_path.rglob("*.xml"))
        
        for xml_file in xml_files:
            try:
                with open(xml_file, 'r', encoding='utf-8') as f:
                    content = f.read()
                
                # Look for section with matching ID
                section_pattern = rf'<section[^>]*id="{re.escape(clean_id)}"[^>]*>(.*?)</section>'
                match = re.search(section_pattern, content, re.DOTALL | re.IGNORECASE)
                
                if match:
                    section_content = match.group(1)
                    return self.truncate_content(section_content)
                    
            except Exception as e:
                print(f"Warning: Could not read {xml_file}: {e}")
                continue
        
        return None
    
    def truncate_content(self, content: str) -> str:
        """Truncate content to maximum lines for processing."""
        lines = content.split('\n')
        if len(lines) > self.max_lines:
            truncated = '\n'.join(lines[:self.max_lines])
            truncated += f"\n\n[Content truncated - showing first {self.max_lines} lines of {len(lines)} total lines]"
            return truncated
        return content
    
    def read_csv_data(self) -> List[Dict]:
        """Read existing CSV data."""
        rows = []
        with open(self.csv_file, 'r', encoding='utf-8') as f:
            reader = csv.DictReader(f)
            for row in reader:
                rows.append(row)
        return rows
    
    def write_csv_with_summaries(self, rows: List[Dict]) -> None:
        """Write CSV data with new Page Summary column."""
        if not rows:
            return
            
        # Add Page Summary column if not present
        fieldnames = list(rows[0].keys())
        if 'Page Summary' not in fieldnames:
            fieldnames.append('Page Summary')
        
        with open(self.csv_file, 'w', newline='', encoding='utf-8') as f:
            writer = csv.DictWriter(f, fieldnames=fieldnames)
            writer.writeheader()
            writer.writerows(rows)
    
    def write_csv_with_categories(self, rows: List[Dict]) -> None:
        """Write CSV data with new Category column."""
        if not rows:
            return
            
        # Add Category column if not present
        fieldnames = list(rows[0].keys())
        if 'Category' not in fieldnames:
            fieldnames.append('Category')
        
        with open(self.csv_file, 'w', newline='', encoding='utf-8') as f:
            writer = csv.DictWriter(f, fieldnames=fieldnames)
            writer.writeheader()
            writer.writerows(rows)
    
    def get_missing_content_report(self, rows: List[Dict]) -> List[str]:
        """Generate report of missing content files."""
        missing = []
        for row in rows:
            href = row.get('Href', '')
            if href and not self.find_section_content(href):
                missing.append(f"- {row.get('Page Title', 'Unknown')}: {href}")
        return missing

def main():
    parser = argparse.ArgumentParser(description='Process content for ToC analysis')
    parser.add_argument('--content-path', required=True, help='Path to content directory')
    parser.add_argument('--csv-file', default='output/toc-analysis.csv', help='CSV file to process')
    parser.add_argument('--operation', choices=['validate', 'prepare-summaries', 'prepare-categories'], 
                       required=True, help='Operation to perform')
    
    args = parser.parse_args()
    
    summarizer = ContentSummarizer(args.content_path, args.csv_file)
    
    if not summarizer.validate_inputs():
        exit(1)
    
    if args.operation == 'validate':
        rows = summarizer.read_csv_data()
        missing = summarizer.get_missing_content_report(rows)
        
        if missing:
            print("Missing content files:")
            for item in missing:
                print(item)
            print(f"\nFound {len(missing)} missing files out of {len(rows)} total pages.")
        else:
            print("All content files found successfully!")
            
    elif args.operation == 'prepare-summaries':
        rows = summarizer.read_csv_data()
        
        # Add empty Page Summary column
        for row in rows:
            if 'Page Summary' not in row:
                row['Page Summary'] = ''
        
        summarizer.write_csv_with_summaries(rows)
        print("CSV prepared with Page Summary column. Ready for AI processing.")
        
    elif args.operation == 'prepare-categories':
        rows = summarizer.read_csv_data()
        
        # Add empty Category column
        for row in rows:
            if 'Category' not in row:
                row['Category'] = ''
        
        summarizer.write_csv_with_categories(rows)
        print("CSV prepared with Category column. Ready for AI categorization.")

if __name__ == '__main__':
    main()