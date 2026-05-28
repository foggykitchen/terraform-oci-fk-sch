output "service_connector_id" {
  description = "Service Connector OCID."
  value       = oci_sch_service_connector.this.id
}

output "service_connector_name" {
  description = "Resolved Service Connector display name."
  value       = oci_sch_service_connector.this.display_name
}

output "service_connector_state" {
  description = "Lifecycle state of the Service Connector."
  value       = oci_sch_service_connector.this.state
}

output "service_connector" {
  description = "Structured Service Connector details."
  value = {
    id             = oci_sch_service_connector.this.id
    display_name   = oci_sch_service_connector.this.display_name
    description    = oci_sch_service_connector.this.description
    compartment_id = oci_sch_service_connector.this.compartment_id
    state          = oci_sch_service_connector.this.state
  }
}
