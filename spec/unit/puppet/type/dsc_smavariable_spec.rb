#!/usr/bin/env ruby
require 'spec_helper'

describe Puppet::Type.type(:dsc_smavariable) do

  let :dsc_smavariable do
    Puppet::Type.type(:dsc_smavariable).new(
      :name     => 'foo',
      :dsc_name => 'foo',
      :dsc_webserviceendpoint => 'foo',
    )
  end

  it 'should allow all properties to be specified' do
    expect { Puppet::Type.type(:dsc_smavariable).new(
      :name     => 'foo',
      :dsc_ensure => 'Present',
      :dsc_name => 'foo',
      :dsc_value => 'foo',
      :dsc_description => 'foo',
      :dsc_set => true,
      :dsc_webserviceendpoint => 'foo',
      :dsc_port => 32,
    )}.to_not raise_error
  end

  it "should stringify normally" do
    expect(dsc_smavariable.to_s).to eq("Dsc_smavariable[foo]")
  end

  it 'should default to ensure => present' do
    expect(dsc_smavariable[:ensure]).to eq :present
  end

  it 'should accept dsc_ensure predefined value Present' do
    dsc_smavariable[:dsc_ensure] = 'Present'
    expect(dsc_smavariable[:dsc_ensure]).to eq('Present')
  end

  it 'should accept dsc_ensure predefined value present' do
    dsc_smavariable[:dsc_ensure] = 'present'
    expect(dsc_smavariable[:dsc_ensure]).to eq('present')
  end

  it 'should accept dsc_ensure predefined value present and update ensure with this value (ensure end value should be a symbol)' do
    dsc_smavariable[:dsc_ensure] = 'present'
    expect(dsc_smavariable[:ensure]).to eq(dsc_smavariable[:dsc_ensure].downcase.to_sym)
  end

  it 'should accept dsc_ensure predefined value Absent' do
    dsc_smavariable[:dsc_ensure] = 'Absent'
    expect(dsc_smavariable[:dsc_ensure]).to eq('Absent')
  end

  it 'should accept dsc_ensure predefined value absent' do
    dsc_smavariable[:dsc_ensure] = 'absent'
    expect(dsc_smavariable[:dsc_ensure]).to eq('absent')
  end

  it 'should accept dsc_ensure predefined value absent and update ensure with this value (ensure end value should be a symbol)' do
    dsc_smavariable[:dsc_ensure] = 'absent'
    expect(dsc_smavariable[:ensure]).to eq(dsc_smavariable[:dsc_ensure].downcase.to_sym)
  end

  it 'should not accept values not equal to predefined values' do
    expect{dsc_smavariable[:dsc_ensure] = 'invalid value'}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept array for dsc_ensure' do
    expect{dsc_smavariable[:dsc_ensure] = ["foo", "bar", "spec"]}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept boolean for dsc_ensure' do
    expect{dsc_smavariable[:dsc_ensure] = true}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept int for dsc_ensure' do
    expect{dsc_smavariable[:dsc_ensure] = -16}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept uint for dsc_ensure' do
    expect{dsc_smavariable[:dsc_ensure] = 16}.to raise_error(Puppet::ResourceError)
  end

  it 'should require that dsc_name is specified' do
    #dsc_smavariable[:dsc_name]
    expect { Puppet::Type.type(:dsc_smavariable).new(
      :name     => 'foo',
      :dsc_webserviceendpoint => 'foo',
    )}.to raise_error(Puppet::Error, /dsc_name is a required attribute/)
  end

  it 'should not accept array for dsc_name' do
    expect{dsc_smavariable[:dsc_name] = ["foo", "bar", "spec"]}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept boolean for dsc_name' do
    expect{dsc_smavariable[:dsc_name] = true}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept int for dsc_name' do
    expect{dsc_smavariable[:dsc_name] = -16}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept uint for dsc_name' do
    expect{dsc_smavariable[:dsc_name] = 16}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept array for dsc_value' do
    expect{dsc_smavariable[:dsc_value] = ["foo", "bar", "spec"]}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept boolean for dsc_value' do
    expect{dsc_smavariable[:dsc_value] = true}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept int for dsc_value' do
    expect{dsc_smavariable[:dsc_value] = -16}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept uint for dsc_value' do
    expect{dsc_smavariable[:dsc_value] = 16}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept array for dsc_description' do
    expect{dsc_smavariable[:dsc_description] = ["foo", "bar", "spec"]}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept boolean for dsc_description' do
    expect{dsc_smavariable[:dsc_description] = true}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept int for dsc_description' do
    expect{dsc_smavariable[:dsc_description] = -16}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept uint for dsc_description' do
    expect{dsc_smavariable[:dsc_description] = 16}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept array for dsc_set' do
    expect{dsc_smavariable[:dsc_set] = ["foo", "bar", "spec"]}.to raise_error(Puppet::ResourceError)
  end

  it 'should accept boolean for dsc_set' do
    dsc_smavariable[:dsc_set] = true
    expect(dsc_smavariable[:dsc_set]).to eq(true)
  end

  it "should accept boolean-like value 'true' and munge this value to boolean for dsc_set" do
    dsc_smavariable[:dsc_set] = 'true'
    expect(dsc_smavariable[:dsc_set]).to eq(true)
  end

  it "should accept boolean-like value 'false' and munge this value to boolean for dsc_set" do
    dsc_smavariable[:dsc_set] = 'false'
    expect(dsc_smavariable[:dsc_set]).to eq(false)
  end

  it "should accept boolean-like value 'True' and munge this value to boolean for dsc_set" do
    dsc_smavariable[:dsc_set] = 'True'
    expect(dsc_smavariable[:dsc_set]).to eq(true)
  end

  it "should accept boolean-like value 'False' and munge this value to boolean for dsc_set" do
    dsc_smavariable[:dsc_set] = 'False'
    expect(dsc_smavariable[:dsc_set]).to eq(false)
  end

  it "should accept boolean-like value :true and munge this value to boolean for dsc_set" do
    dsc_smavariable[:dsc_set] = :true
    expect(dsc_smavariable[:dsc_set]).to eq(true)
  end

  it "should accept boolean-like value :false and munge this value to boolean for dsc_set" do
    dsc_smavariable[:dsc_set] = :false
    expect(dsc_smavariable[:dsc_set]).to eq(false)
  end

  it 'should not accept int for dsc_set' do
    expect{dsc_smavariable[:dsc_set] = -16}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept uint for dsc_set' do
    expect{dsc_smavariable[:dsc_set] = 16}.to raise_error(Puppet::ResourceError)
  end

  it 'should require that dsc_webserviceendpoint is specified' do
    #dsc_smavariable[:dsc_webserviceendpoint]
    expect { Puppet::Type.type(:dsc_smavariable).new(
      :name     => 'foo',
      :dsc_name => 'foo',
    )}.to raise_error(Puppet::Error, /dsc_webserviceendpoint is a required attribute/)
  end

  it 'should not accept array for dsc_webserviceendpoint' do
    expect{dsc_smavariable[:dsc_webserviceendpoint] = ["foo", "bar", "spec"]}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept boolean for dsc_webserviceendpoint' do
    expect{dsc_smavariable[:dsc_webserviceendpoint] = true}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept int for dsc_webserviceendpoint' do
    expect{dsc_smavariable[:dsc_webserviceendpoint] = -16}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept uint for dsc_webserviceendpoint' do
    expect{dsc_smavariable[:dsc_webserviceendpoint] = 16}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept array for dsc_port' do
    expect{dsc_smavariable[:dsc_port] = ["foo", "bar", "spec"]}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept boolean for dsc_port' do
    expect{dsc_smavariable[:dsc_port] = true}.to raise_error(Puppet::ResourceError)
  end

  it 'should accept uint for dsc_port' do
    dsc_smavariable[:dsc_port] = 32
    expect(dsc_smavariable[:dsc_port]).to eq(32)
  end

  it 'should not accept signed (negative) value for dsc_port' do
    value = -32
    expect(value).to be < 0
    expect{dsc_smavariable[:dsc_port] = value}.to raise_error(Puppet::ResourceError)
  end

  it 'should accept string-like uint for dsc_port' do
    dsc_smavariable[:dsc_port] = '16'
    expect(dsc_smavariable[:dsc_port]).to eq(16)
  end

  it 'should accept string-like uint for dsc_port' do
    dsc_smavariable[:dsc_port] = '32'
    expect(dsc_smavariable[:dsc_port]).to eq(32)
  end

  it 'should accept string-like uint for dsc_port' do
    dsc_smavariable[:dsc_port] = '64'
    expect(dsc_smavariable[:dsc_port]).to eq(64)
  end

  # Configuration PROVIDER TESTS

  describe "powershell provider tests" do

    it "should successfully instanciate the provider" do
      described_class.provider(:powershell).new(dsc_smavariable)
    end

    before(:each) do
      @provider = described_class.provider(:powershell).new(dsc_smavariable)
    end

    describe "when dscmeta_module_name existing/is defined " do

      it "should compute powershell dsc test script with Invoke-DscResource" do
        expect(@provider.ps_script_content('test')).to match(/Invoke-DscResource/)
      end

      it "should compute powershell dsc test script with method Test" do
        expect(@provider.ps_script_content('test')).to match(/Method\s+=\s*'test'/)
      end

      it "should compute powershell dsc set script with Invoke-DscResource" do
        expect(@provider.ps_script_content('set')).to match(/Invoke-DscResource/)
      end

      it "should compute powershell dsc test script with method Set" do
        expect(@provider.ps_script_content('set')).to match(/Method\s+=\s*'set'/)
      end

    end

    describe "when dsc_ensure is 'present'" do

      before(:each) do
        dsc_smavariable.original_parameters[:dsc_ensure] = 'present'
        dsc_smavariable[:dsc_ensure] = 'present'
        @provider = described_class.provider(:powershell).new(dsc_smavariable)
      end

      it "should update :ensure to :present" do
        expect(dsc_smavariable[:ensure]).to eq(:present)
      end

      it "should compute powershell dsc test script in which ensure value is 'present'" do
        expect(@provider.ps_script_content('test')).to match(/ensure = 'present'/)
      end

      it "should compute powershell dsc set script in which ensure value is 'present'" do
        expect(@provider.ps_script_content('set')).to match(/ensure = 'present'/)
      end

    end

    describe "when dsc_ensure is 'absent'" do

      before(:each) do
        dsc_smavariable.original_parameters[:dsc_ensure] = 'absent'
        dsc_smavariable[:dsc_ensure] = 'absent'
        @provider = described_class.provider(:powershell).new(dsc_smavariable)
      end

      it "should update :ensure to :absent" do
        expect(dsc_smavariable[:ensure]).to eq(:absent)
      end

      it "should compute powershell dsc test script in which ensure value is 'present'" do
        expect(@provider.ps_script_content('test')).to match(/ensure = 'present'/)
      end

      it "should compute powershell dsc set script in which ensure value is 'absent'" do
        expect(@provider.ps_script_content('set')).to match(/ensure = 'absent'/)
      end

    end

  end
end
