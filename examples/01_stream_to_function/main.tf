module "sch" {
  source = "../.."

  name             = "fk-stream-to-function"
  compartment_ocid = var.compartment_ocid

  streaming_source = {
    stream_id = var.stream_id
  }

  functions_target = {
    function_id = var.function_id
  }
}
