# terraform-oci-fk-sch

This repository contains a reusable **Terraform/OpenTofu module** and focused examples for deploying **Oracle Cloud Infrastructure (OCI) Service Connector Hub (SCH)** connectors.

It is part of the **[FoggyKitchen.com training ecosystem](https://foggykitchen.com/courses-2/)** and is designed to work cleanly with reusable infrastructure modules such as **`terraform-oci-fk-streaming`**, **`terraform-oci-fk-function`**, and future event-driven integration components.

Support expectations are documented in [SUPPORT.md](SUPPORT.md).

---

## Used By

This module is used as a building block by the higher-level [FoggyKitchen Landing Zone Orchestrator](https://github.com/foggykitchen/foggykitchen-landing-zone-orchestrator), where it is composed into Azure, OCI, and multicloud landing zone patterns.

## Purpose

The goal of this module is to provide a **clean, composable, and educational reference implementation** for OCI Service Connector Hub:

- Focused on OCI-native Service Connector primitives
- Suitable for `Streaming -> Functions` event-driven pipelines
- Designed for hands-on learning, module composition, and asynchronous integration scenarios

This is **not** a general event processing framework. It is a **small, explicit infrastructure module** for OCI Service Connector Hub.

---

## What the module does

The module creates:

- OCI Service Connector Hub connector

The module intentionally does **not** create:

- OCI Functions applications or functions
- Streams or stream pools
- VCNs or subnets
- IAM policies for connector execution
- Notifications topics or subscriptions
- API Gateways

Each of those concerns belongs in its own dedicated module.

---

## Repository Structure

```bash
terraform-oci-fk-sch/
├── examples/
│   ├── 01_stream_to_function/
│   ├── 02_explicit_connector_name/
│   └── README.md
├── main.tf
├── inputs.tf
├── outputs.tf
├── versions.tf
├── LICENSE
└── README.md
```

The examples are intentionally small and show **incremental Service Connector Hub patterns**, starting from a minimal Streaming-to-Functions connector and then moving into an explicit naming variant.

---

## Example Usage

### Minimal `Streaming -> Functions` connector

```hcl
module "sch" {
  source = "git::https://github.com/foggykitchen/terraform-oci-fk-sch.git?ref=v0.1.0"

  name             = "fk-stream-to-function"
  compartment_ocid = var.compartment_ocid

  streaming_source = {
    stream_id = var.stream_id
  }

  functions_target = {
    function_id = var.function_id
  }
}
```

### Explicit connector naming

```hcl
module "sch" {
  source = "git::https://github.com/foggykitchen/terraform-oci-fk-sch.git?ref=v0.1.0"

  name                   = "fk-stream-to-function"
  service_connector_name = "FoggyKitchenServiceConnector"
  compartment_ocid       = var.compartment_ocid
  description            = "Service Connector Hub from Streaming to OCI Functions"

  streaming_source = {
    stream_id   = var.stream_id
    cursor_kind = "TRIM_HORIZON"
  }

  functions_target = {
    function_id = var.function_id
  }
}
```

---

## Module Inputs

| Variable | Type | Required | Description |
|--------|------|----------|-------------|
| `name` | `string` | ✅ | Base name used when `service_connector_name` is not provided |
| `compartment_ocid` | `string` | ✅ | OCI compartment OCID |
| `service_connector_name` | `string` | ❌ | Optional explicit Service Connector display name override |
| `description` | `string` | ❌ | Description assigned to the Service Connector |
| `streaming_source` | `object({ stream_id = string, cursor_kind = optional(string, "TRIM_HORIZON") })` | ✅ | Streaming source settings |
| `functions_target` | `object({ function_id = string })` | ✅ | Functions target settings |

---

## Outputs

| Output | Description |
|------|-------------|
| `service_connector_id` | Service Connector OCID |
| `service_connector_name` | Resolved Service Connector display name |
| `service_connector_state` | Lifecycle state of the connector |
| `service_connector` | Structured object with connector details |

---

## Examples Overview

| Example | Description |
|-------|-------------|
| `01_stream_to_function` | Minimal `Streaming -> Functions` Service Connector |
| `02_explicit_connector_name` | Same connector pattern with explicit display name and description |

See [`examples/`](examples) for details.

---

## Design Philosophy

- Explicit over implicit
- Small modules over monoliths
- Connector configuration separated from producers, consumers, and networking
- Optimized for **learning, reuse, and composition**

This makes the module ideal for:

- Function-based async ingestion pipelines
- Streaming-driven event routing
- OCI integration workshops
- Multimodule training scenarios

---

## Related Resources

- [FoggyKitchen OCI Function Module (terraform-oci-fk-function)](https://github.com/foggykitchen/terraform-oci-fk-function)
- [FoggyKitchen OCI Streaming Module (terraform-oci-fk-streaming)](https://github.com/foggykitchen/terraform-oci-fk-streaming)
- [FoggyKitchen OCI ONS Module (terraform-oci-fk-ons)](https://github.com/foggykitchen/terraform-oci-fk-ons)

---

## License

Licensed under the **Universal Permissive License (UPL), Version 1.0**.
See [LICENSE](LICENSE) for details.

---

© 2026 [FoggyKitchen.com](https://foggykitchen.com) - Cloud. Code. Clarity.
