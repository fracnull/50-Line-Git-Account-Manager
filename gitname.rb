#!/usr/bin/env ruby

# gitname {nickname} - call git config using credentials under nickname
# gitname list - list all nicknames
# gitname set {nickname} {name} {email} - store credentials under nickname
# gitname delete {nickname} - delete credentials under nickname

require "yaml"

file_path = "/usr/local/bin/gitname.yaml"

class Account
  attr_accessor :name, :email
end

# save hash as yaml
def save(obj, path)
  yaml = YAML.dump obj
  File.write path, yaml, mode: "w"
end

accounts = {} # hash storing nickname -> Account

if File.exists? file_path
  yaml = File.read file_path
  accounts = YAML.load yaml
end

case ARGV[0] # switch statement for first argument
when "list"
  puts accounts.keys
when "set"
  acc = Account.new
  acc.name = ARGV[2] # name
  acc.email = ARGV[3] # email
  accounts[ARGV[1]] = acc
  save accounts, file_path
when "delete"
  accounts = accounts.except(ARGV[1]) # remove the account from accounts
  save accounts, file_path
else
  account = accounts[ARGV[0]] # nickname
  if account.nil? # the account is not in the hash
    puts "account does not exist"
  else
    `git config user.name "#{account.name}"`
    `git config user.email "#{account.email}"`
  end
end
