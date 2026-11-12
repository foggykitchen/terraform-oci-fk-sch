# Synthetic fixtures only. Every run is plan-only; no tenancy credentials are used.
mock_provider "oci" {
  mock_resource "oci_sch_service_connector" {
    defaults = { "id" = "MOCK_OCID_CONNECTOR", "lifecycle_details" = "mock-value", "lifecyle_details" = "mock-value", "system_tags" = {}, "time_created" = "mock-value", "time_updated" = "mock-value" }
  }
}
variables {
  name             = "compatibility"
  compartment_ocid = "MOCK_OCID_COMPARTMENT"
  streaming_source = { "stream_id" = "MOCK_OCID_STREAM" }
  functions_target = { "function_id" = "MOCK_OCID_FNFUNC" }
}

run "oci9_plan" {
  command = plan
}
