#
# Copyright 2017 Google Inc.
#
# Licensed under the Apache License, Version 2.0 (the "License");
# you may not use this file except in compliance with the License.
# You may obtain a copy of the License at
#
#   http://www.apache.org/licenses/LICENSE-2.0
#
# Unless required by applicable law or agreed to in writing, software
# distributed under the License is distributed on an "AS IS" BASIS,
# WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
# See the License for the specific language governing permissions and
# limitations under the License.
#

output service_account_email {
  value = "${google_service_account.vault-admin.email}"

  description = <<EOF
Email for the vault-admin service account.
EOF
}

output vault_addr {
  value = "https://${google_compute_address.vault.address}:${var.vault_port}"

  description = <<EOF
Full protocol, address, and port (FQDN) pointing to the Vault load balancer.
This is a drop-in to VAULT_ADDR:

    export VAULT_ADDR="$(terraform output vault_addr)"

And then continue to use Vault commands as usual.
EOF
}

output vault_lb_addr {
  value = "${google_compute_address.vault.address}"

  description = <<EOF
Address of the load balancer without port or protocol information. You probably
want to use `vault_addr`.
EOF
}

output vault_lb_port {
  value = "${var.vault_port}"

  description = <<EOF
Port where Vault is exposed on the load balancer.
EOF
}
