# AWS SOCI Index Builder Documentation
The documentation is available at: https://awslabs.github.io/cfn-ecr-aws-soci-index-builder/

## Documentation Generation

### Important Notes

- **DO NOT manually edit HTML files** - All HTML documentation is automatically generated from AsciiDoc source files.
- **Run `build_docs.sh`** to generate the HTML documentation.
- **Documentation updates should me made only in the appropriate AsciiDoc files** located in the `docs/deployment_guide/partner_editable/` directory.
- **Legacy V1 documentation** has been moved to the `v1/` directory for reference.

### Documentation Structure

- `docs/deployment_guide/partner_editable/` - Contains the editable AsciiDoc files for documentation content
- `docs/boilerplate/` - Contains template files and common elements (do not modify). This is taken from https://github.com/aws-ia/aws-ia-documentation-base-common
- `v1/` - Contains legacy V1 documentation (for reference only)

### How to Update Documentation

1. Make changes to the appropriate AsciiDoc files in `docs/deployment_guide/partner_editable/`
2. Run the build script to generate HTML:
   ```
   ./build_docs.sh
   ```
3. The script will generate `index.html` and `prod_example.html` in the project root

### Available AsciiDoc Files for Editing

- `_settings.adoc` - Basic settings and metadata
- `architecture.adoc` - Architecture description and diagrams
- `deployment_options.adoc` - Available deployment options
- `licenses.adoc` - License information
- `overview.adoc` - Product overview
- `post_deployment.adoc` - Post-deployment steps
- `pre_deployment.adoc` - Pre-deployment requirements
- `troubleshooting.adoc` - Troubleshooting guide
