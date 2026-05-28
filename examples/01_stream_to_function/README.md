# Example 01: Stream to Function

This example shows the smallest useful **OCI Service Connector Hub** pattern for FoggyKitchen modules:

- source: **OCI Streaming**
- target: **OCI Functions**

It is intentionally self-contained only at the Service Connector layer, so you can plug it into bigger stacks where the stream and function are created elsewhere.

---

## What This Example Shows

- minimal Service Connector Hub configuration
- `TRIM_HORIZON` cursor start for Streaming consumption
- clean composition with existing stream and function resources

---

## Example Usage

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
