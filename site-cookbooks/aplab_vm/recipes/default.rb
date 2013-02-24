execute "apt-get-update" do
  command "apt-get update"
  ignore_failure true
  not_if do ::File.exists?('/var/lib/apt/periodic/update-success-stamp') end
end

package "git"
gem_package "bundle"
gem_package "librarian"

execute "librarian-chef update" do
  command "librarian-chef update"
  cwd "/vagrant"
end
