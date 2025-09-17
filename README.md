# Content Audit Assistant

A toolkit for conducting documentation content audits, specifically designed for AWS documentation but adaptable to other technical documentation projects.

## Overview

This package provides tools and templates for systematically analyzing, categorizing, and reorganizing large documentation sections. It works with any AWS documentation that provides JSON table of contents data.

## Package Structure

```
content-audit-assistant/
├── README.md                           # This file
├── output/                           # Generated audit documents
├── prompts/                          # Reusable prompts for different audit phases
│   ├── extract-toc-structure.md     # Extract ToC from JSON
│   ├── analyze-content-categories.md # Categorize content
│   └── create-audit-framework.md    # Generate audit structure
└── tools/                           # Automation scripts
    └── toc-extractor.sh             # Extract ToC sections from JSON
```

## Quick Start

### 1. Extract ToC Structure

Use the shell script to extract and analyze table of contents structure from AWS documentation JSON:

```bash
# Using section title
./tools/toc-extractor.sh \
  "https://docs.aws.amazon.com/sagemaker/latest/dg/toc-contents.json" \
  "Domain overview"

# Using section href (more stable identifier)
./tools/toc-extractor.sh \
  "https://docs.aws.amazon.com/sagemaker/latest/dg/toc-contents.json" \
  "gs-studio-onboard.html"
```

**Parameters:**
- `JSON_URL`: AWS documentation ToC URL (format: `https://docs.aws.amazon.com/[service]/latest/[guide]/toc-contents.json`)
- `SECTION_TITLE_OR_HREF`: Section title (e.g., "Domain overview") or href (e.g., "gs-studio-onboard.html")

**Output:** Always generates:
- `output/toc-analysis.md` (structured analysis)
- `output/toc-analysis.csv` (hierarchical table - open in Excel/Google Sheets)

**Note:** Using href is recommended as it's less likely to change than section titles.

**Requirements:**
- `curl` and `jq` must be installed
- Internet connection to fetch JSON data

### 2. Review Generated Analysis

The tool creates a structured analysis document with:
- **Hierarchical Structure**: Complete ToC breakdown by levels
- **Quantitative Analysis**: Page counts, nesting patterns, distribution
- **Visual Tree**: ASCII tree structure for easy visualization
- **Detailed Breakdown**: Section-by-section organization

Example output structure:
```
# Domain overview - Table of Contents Analysis

## Overview
This document provides a structured analysis...

## ToC Structure
### Level 1: Main Section (1 item)
### Level 2: Primary Topics (4 items)
### Level 3: Secondary Topics (25 items)

## Content Analysis Summary
**Total Pages**: 30
**Distribution**: Level 1: 1, Level 2: 4, Level 3: 25

## Visual ToC Hierarchy
```
Domain overview
├── SageMaker AI domain entities
├── Create a domain
├── View domain details
└── Delete a domain
```
```

### 3. Conduct Content Analysis and Restructuring

**Summary**: This phase uses AI to analyze content pages, identify user personas, categorize content by user needs, and propose an improved ToC structure. The process involves setting up content sources (XML files), generating page summaries with persona identification, creating categories based on user journeys, and proposing a restructured ToC organization.

**⚠️ IMPORTANT**: You must run the content analysis prompt in an AI tool (like Q CLI, Amazon Q, Cline, etc.).

**Examples:**
In the AI tool ask it to:
```
Run `prompts/analyze-content-restructure.md` prompt
```

**AI Workflow Phases:**
1. **Setup & Validation**: Provide path to XML content files
2. **Content Summarization**: AI analyzes each page and identifies personas
3. **Categorization Analysis**: AI groups content by user journey and tasks
4. **Restructuring Proposal**: AI proposes improved ToC organization with rationale

**Expected Output Files:**
- `output/content-analysis.csv` (page summaries and persona assignments)
- `output/restructure-proposal.md` (detailed analysis and rationale)
- `output/restructure-proposal.csv` (new ToC structure)

## Customization

### For Other AWS Services
Replace the JSON URL with your target service:
```bash
# Example for EC2 documentation using title
./tools/toc-extractor.sh \
  "https://docs.aws.amazon.com/ec2/latest/userguide/toc-contents.json" \
  "Getting started"

# Example for EC2 documentation using href
./tools/toc-extractor.sh \
  "https://docs.aws.amazon.com/ec2/latest/userguide/toc-contents.json" \
  "EC2_GetStarted.html"
```

### For Non-AWS Documentation
Modify `tools/toc-extractor.sh` to support other JSON formats or create new extraction methods for different documentation systems.

---

*This toolkit provides a starting point for systematic content audits. Adapt and extend based on your specific documentation needs.*