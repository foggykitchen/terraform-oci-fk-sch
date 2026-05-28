variable "name" {
  description = "Base name used for the Service Connector when service_connector_name is not provided."
  type        = string
}

variable "compartment_ocid" {
  description = "OCI compartment OCID."
  type        = string
}

variable "service_connector_name" {
  description = "Optional explicit Service Connector name override."
  type        = string
  default     = null
}

variable "description" {
  description = "Description assigned to the Service Connector."
  type        = string
  default     = "FoggyKitchen Service Connector Hub"
}

variable "streaming_source" {
  description = "Streaming source configuration for the Service Connector."
  type = object({
    stream_id   = string
    cursor_kind = optional(string, "TRIM_HORIZON")
  })

  validation {
    condition     = contains(["TRIM_HORIZON", "LATEST", "AT_TIME"], var.streaming_source.cursor_kind)
    error_message = "streaming_source.cursor_kind must be one of TRIM_HORIZON, LATEST, or AT_TIME."
  }
}

variable "functions_target" {
  description = "Functions target configuration for the Service Connector."
  type = object({
    function_id = string
  })
}
