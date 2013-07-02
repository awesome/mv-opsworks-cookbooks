node[:deploy].each do |application, deploy|
  template "#{deploy[:deploy_to]}/shared/config/too_many_secrets.rb" do
    source "too_many_secrets.rb.erb"
    cookbook 'deployment'
    mode "0660"
    group deploy[:group]
    owner deploy[:user]
    
    variables(:secret => deploy[:secrets].to_hash)

    # notifies :run, resources(:execute => "restart Rails app #{application}")

    only_if do
      File.exists?("#{deploy[:deploy_to]}") && File.exists?("#{deploy[:deploy_to]}/shared/config/")
    end
  end
end
