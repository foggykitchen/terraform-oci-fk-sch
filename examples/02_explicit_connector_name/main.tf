module "sch" {
  source = "../.."

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
