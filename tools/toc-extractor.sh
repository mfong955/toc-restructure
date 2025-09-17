#!/bin/bash

# ToC Structure Extractor
# Extracts hierarchical table of contents structure from AWS JSON documentation
# Usage: ./toc-extractor.sh [JSON_URL] [SECTION_TITLE_OR_HREF]

set -e

# Parameters
JSON_URL=${1:-""}
SECTION_IDENTIFIER=${2:-""}
OUTPUT_FILE="output/toc-analysis.md"
CSV_FILE="output/toc-analysis.csv"

# Colors for output
RED='\033[0;31m'
GREEN='\033[0;32m'
YELLOW='\033[1;33m'
NC='\033[0m' # No Color

# Helper functions
log_info() {
    echo -e "${GREEN}[INFO]${NC} $1"
}

log_warn() {
    echo -e "${YELLOW}[WARN]${NC} $1"
}

log_error() {
    echo -e "${RED}[ERROR]${NC} $1"
}

# Check dependencies
check_dependencies() {
    local deps=("curl" "jq")
    for dep in "${deps[@]}"; do
        if ! command -v "$dep" &> /dev/null; then
            log_error "$dep is required but not installed"
            exit 1
        fi
    done
}

# Extract from AWS JSON ToC
extract_aws_json() {
    local url="$1"
    local section="$2"
    
    log_info "Extracting from AWS JSON ToC: $section"
    
    # Create jq filter for hierarchical extraction
    local jq_filter='
    def format_item(item; level):
      (("  " * level) + "- **" + item.title + "** (`" + item.href + "`)"),
      (if item.contents then item.contents[] | format_item(.; level + 1) else empty end);

    def find_section(item):
      if (item.title == "'"$section"'" or item.href == "'"$section"'") then
        format_item(item; 0)
      elif item.contents then
        item.contents[] | find_section(.)
      else
        empty
      end;

    . as $root | find_section($root)'
    
    # Extract the structure
    local structure
    structure=$(curl -s "$url" | jq -r "$jq_filter" 2>/dev/null)
    
    if [ -z "$structure" ]; then
        log_error "Section '$section' not found in ToC (searched by title and href)"
        exit 1
    fi
    
    # Generate analysis and CSV
    generate_analysis "$section" "$structure"
    generate_csv "$section" "$structure"
}

# Generate comprehensive analysis
generate_analysis() {
    local section="$1"
    local structure="$2"
    
    log_info "Generating analysis for: $section"
    
    # Ensure output directory exists
    mkdir -p "$(dirname "$OUTPUT_FILE")"
    
    # Count items at each level
    local level1_count=$(echo "$structure" | grep -c "^- " || echo "0")
    local level2_count=$(echo "$structure" | grep -c "^  - " || echo "0")
    local level3_count=$(echo "$structure" | grep -c "^    - " || echo "0")
    local level4_count=$(echo "$structure" | grep -c "^      - " || echo "0")
    local total_count=$((level1_count + level2_count + level3_count + level4_count))
    
    # Generate tree structure
    local tree_structure
    tree_structure=$(echo "$structure" | sed 's/^- \*\*\(.*\)\*\* (`.*`)/\1/' | \
                     sed 's/^  - \*\*\(.*\)\*\* (`.*`)/├── \1/' | \
                     sed 's/^    - \*\*\(.*\)\*\* (`.*`)/│   ├── \1/' | \
                     sed 's/^      - \*\*\(.*\)\*\* (`.*`)/│   │   ├── \1/')
    
    # Create the analysis document
    cat > "$OUTPUT_FILE" << EOF
# $section - Table of Contents Analysis

## Overview
This document provides a structured analysis of the "$section" section, showing the hierarchical organization and ToC levels for better visualization and content planning.

## ToC Structure

### Level 1: Main Section ($level1_count item)
$(echo "$structure" | grep "^- " | head -1)

### Level 2: Primary Topics ($level2_count items)
$(echo "$structure" | grep "^  - " | sed 's/^  //')

### Level 3: Secondary Topics ($level3_count items)
$(echo "$structure" | grep "^    - " | sed 's/^    //')

### Level 4: Tertiary Topics ($level4_count items)
$(echo "$structure" | grep "^      - " | sed 's/^      //')

## Content Analysis Summary

**Total Pages**: $total_count
**Distribution**:
- Level 1: $level1_count
- Level 2: $level2_count  
- Level 3: $level3_count
- Level 4: $level4_count

**Nesting Patterns**:
- Maximum depth: $(if [ $level4_count -gt 0 ]; then echo "4 levels"; elif [ $level3_count -gt 0 ]; then echo "3 levels"; elif [ $level2_count -gt 0 ]; then echo "2 levels"; else echo "1 level"; fi)
- Sections with subsections: $(echo "$structure" | grep -c "^  - " || echo "0")

## Visual ToC Hierarchy

\`\`\`
$tree_structure
\`\`\`

## Detailed Structure

$structure

---
*Generated on $(date) using toc-extractor.sh*
EOF

    log_info "Analysis saved to: $OUTPUT_FILE"
}

# Generate CSV with hierarchical structure
generate_csv() {
    local section="$1"
    local structure="$2"
    
    log_info "Generating CSV for: $section"
    
    # Create CSV header
    echo "Level 1,Level 2,Level 3,Level 4,Href,ToC Level" > "$CSV_FILE"
    
    # Process structure to create CSV rows
    
    while IFS= read -r line; do
        if [[ "$line" =~ ^-\ \*\*(.*)\*\*\ \(\`(.*)\`\)$ ]]; then
            # Level 1
            echo "\"${BASH_REMATCH[1]}\",\"\",\"\",\"\",\"${BASH_REMATCH[2]}\",1" >> "$CSV_FILE"
        elif [[ "$line" =~ ^\ \ -\ \*\*(.*)\*\*\ \(\`(.*)\`\)$ ]]; then
            # Level 2
            echo "\"\",\"${BASH_REMATCH[1]}\",\"\",\"\",\"${BASH_REMATCH[2]}\",2" >> "$CSV_FILE"
        elif [[ "$line" =~ ^\ \ \ \ -\ \*\*(.*)\*\*\ \(\`(.*)\`\)$ ]]; then
            # Level 3
            echo "\"\",\"\",\"${BASH_REMATCH[1]}\",\"\",\"${BASH_REMATCH[2]}\",3" >> "$CSV_FILE"
        elif [[ "$line" =~ ^\ \ \ \ \ \ -\ \*\*(.*)\*\*\ \(\`(.*)\`\)$ ]]; then
            # Level 4
            echo "\"\",\"\",\"\",\"${BASH_REMATCH[1]}\",\"${BASH_REMATCH[2]}\",4" >> "$CSV_FILE"
        fi
    done <<< "$structure"
    
    log_info "CSV saved to: $CSV_FILE"
}

# Main execution
main() {
    log_info "ToC Structure Extractor"
    log_info "JSON URL: $JSON_URL"
    log_info "Section: $SECTION_IDENTIFIER"
    log_info "Output: $OUTPUT_FILE"
    
    # Validate inputs
    if [ -z "$JSON_URL" ] || [ -z "$SECTION_IDENTIFIER" ]; then
        log_error "Usage: $0 [JSON_URL] [SECTION_TITLE_OR_HREF]"
        log_error "Example: $0 https://docs.aws.amazon.com/sagemaker/latest/dg/toc-contents.json 'Domain overview'"
        log_error "Example: $0 https://docs.aws.amazon.com/sagemaker/latest/dg/toc-contents.json 'gs-studio-onboard.html'"
        exit 1
    fi
    
    check_dependencies
    
    extract_aws_json "$JSON_URL" "$SECTION_IDENTIFIER"
    
    log_info "Extraction completed successfully!"
    log_info "Generated files:"
    log_info "  - Markdown: $OUTPUT_FILE"
    log_info "  - CSV: $CSV_FILE"
}

# Run main function
main "$@"