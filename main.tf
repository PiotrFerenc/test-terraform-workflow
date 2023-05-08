provider "local" {
  version = "~> 2.1"
}

variable "filename" {
  description = "Nazwa pliku z funkcją Python."
  default     = "hello.py"
}

variable "greeting" {
  description = "Treść powitania."
  default     = "Hello, Terraform and Python!"
}

resource "local_file" "python_file" {
  content = <<-EOT
    def hello():
        print("${var.greeting}")

    if __name__ == "__main__":
        hello()
  EOT
  filename = var.filename
}
