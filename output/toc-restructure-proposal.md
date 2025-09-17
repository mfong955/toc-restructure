# Table of Contents Restructuring Proposal

## Executive Summary

The current Domain overview section suffers from deep nesting (4 levels), scattered related content, and a structure that doesn't align with user workflows. This proposal reorganizes the 30 pages into 4 task-based categories that better serve the primary Administrator persona while maintaining accessibility for other users.

## Analysis Results

### Identified Personas

- **Primary**: Administrators (28 of 30 pages) - Domain managers, IT administrators, DevOps engineers
- **Secondary**: Troubleshooters (8 of 30 pages) - Support teams, operations staff
- **Other**: Developers (2 of 30 pages), Beginners (3 of 30 pages)

### Content Distribution Analysis

- Total pages analyzed: 30
- Current nesting depth: 4 levels (excessive)
- Content type breakdown: Configuration/Management tasks dominate, followed by monitoring/troubleshooting procedures, setup/getting started guides, and reference/concept materials

### Current Structure Issues

- **Excessive nesting depth**: 4-level hierarchy creates cognitive overhead and navigation complexity
- **Scattered related content**: User management tasks spread across multiple sections
- **Mixed abstraction levels**: High-level concepts mixed with detailed procedures
- **Poor task alignment**: Structure doesn't match common administrator workflows
- **Inconsistent grouping**: Similar tasks (like UI customization) split across different sections

## Categorization Strategy

### Chosen Approach: Task-based with User Journey Elements

**Rationale**: The content is heavily administrator-focused (28 of 30 pages) with clear task-oriented patterns. A task-based approach serves the primary persona while incorporating user journey elements for the critical setup flow that beginners need. This approach:

1. **Aligns with user mental models**: Administrators think in terms of tasks they need to accomplish
2. **Reduces cognitive load**: Related tasks are grouped together logically
3. **Supports progressive disclosure**: Basic setup separated from advanced configuration
4. **Enables efficient navigation**: Users can quickly find relevant task categories

### Category Definitions

#### **Get Started** (4 pages)
- **Purpose**: Initial domain setup, onboarding, and foundational concepts
- **Target Persona(s)**: Beginners, Administrators (new to domains)
- **Content Types**: Overview, prerequisites, VPC setup, entity concepts
- **User Journey Stage**: Initial setup and understanding

#### **Configure Domain** (18 pages)
- **Purpose**: Domain configuration, customization, and advanced settings
- **Target Persona(s)**: Administrators
- **Content Types**: UI customization, multi-domain setup, tagging, file systems, settings management
- **User Journey Stage**: Implementation and optimization

#### **Manage Users & Access** (8 pages)
- **Purpose**: User profile and access management tasks
- **Target Persona(s)**: Administrators, Developers
- **Content Types**: User profiles, groups, permissions, spaces, execution roles
- **User Journey Stage**: Ongoing user management

#### **Monitor & Troubleshoot** (5 pages)
- **Purpose**: Monitoring, viewing resources, and problem resolution
- **Target Persona(s)**: Administrators, Troubleshooters
- **Content Types**: Resource viewing, monitoring, shutdown procedures
- **User Journey Stage**: Maintenance and troubleshooting

## Proposed Structure Benefits

### For Administrators (Primary Persona)
- **Faster task completion**: Related tasks grouped together reduce navigation time
- **Clearer mental model**: Structure matches administrator workflow patterns
- **Reduced cognitive overhead**: Shallow hierarchy (2-3 levels max) improves comprehension
- **Better discoverability**: Task-based categories make content easier to locate

### For Troubleshooters (Secondary Persona)
- **Dedicated troubleshooting section**: All monitoring and problem-resolution content in one place
- **Clear escalation path**: Easy to find both viewing and shutdown procedures
- **Reduced search time**: No need to hunt through configuration sections for monitoring content

### Overall Improvements
- **Reduced cognitive load**: Shallow hierarchy (max 3 levels) vs current 4 levels
- **Clearer user pathways**: Task-based organization matches user workflows
- **Improved discoverability**: Related content grouped logically
- **Better alignment with user mental models**: Categories reflect how administrators think about their work
- **Enhanced maintainability**: Logical groupings make it easier to add new content

## Implementation Considerations

### Migration Strategy
1. **Phase 1**: Implement new structure with redirects from old URLs
2. **Phase 2**: Update cross-references and internal links
3. **Phase 3**: Gather user feedback and refine categorization

### Potential Challenges
- **URL changes**: Will require redirect management and link updates
- **User adaptation**: Existing users may need time to adjust to new structure
- **Cross-references**: Many internal links will need updating

### Success Metrics
- **Reduced page depth**: Average depth should decrease from 3.1 to 2.3 levels
- **Improved task completion**: Users should find related content more quickly
- **Better content balance**: More even distribution across categories vs current clustering

## Recommended Next Steps

1. **Validate with user research**: Test proposed categories with actual administrators
2. **Create detailed migration plan**: Map all URL redirects and link updates
3. **Implement in staging**: Test new structure before production deployment
4. **Monitor user behavior**: Track navigation patterns and task completion rates