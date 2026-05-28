# Example 02: Explicit Connector Name

This example shows the same **Streaming -> Functions** connector pattern as Example 01, but with explicit connector naming and description overrides.

Use this when you want:

- a stable human-readable connector name in OCI Console
- a more descriptive training or workshop deployment

---

## What This Example Shows

- explicit `service_connector_name`
- explicit `description`
- same minimal source/target model as the base example

---

## Example Usage

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

## Inputs

- `compartment_ocid`
- `stream_id`
- `function_id`

---

## License

Licensed under the **Universal Permissive License (UPL), Version 1.0**.
See [../../LICENSE](../../LICENSE) for details.

---

© 2026 [FoggyKitchen.com](https://foggykitchen.com) - Cloud. Code. Clarity.
