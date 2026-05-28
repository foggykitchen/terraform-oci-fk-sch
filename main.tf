resource "oci_sch_service_connector" "this" {
  compartment_id = var.compartment_ocid
  display_name   = coalesce(var.service_connector_name, var.name)
  description    = var.description

  source {
    kind      = "streaming"
    stream_id = var.streaming_source.stream_id

    cursor {
      kind = var.streaming_source.cursor_kind
    }
  }

  target {
    kind        = "functions"
    function_id = var.functions_target.function_id
  }
}
