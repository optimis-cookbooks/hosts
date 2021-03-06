require 'chefspec'

describe 'hosts::default' do
  let(:chef_run) { ChefSpec::ChefRunner.new('..').converge 'hosts::default' }

  context 'when no hosts configuration exists for node' do
    it 'should raise a configuration error' do
      expect { chef_run }.to raise_error
    end
  end

  context 'when hosts configuration exists for node' do
    context 'when hosts are defined for node (an empty array)' do
      let(:chef_run) do
        ChefSpec::ChefRunner.new '..' do |node|
          node.set['hosts'] = []
        end.converge 'hosts::default'
      end

      it 'should not raise a missing hosts error' do
        expect { chef_run }.to_not raise_error
      end
    end

    context 'when vhosts are defined for node' do
      let(:chef_run) do
        ChefSpec::ChefRunner.new '..' do |node|
          node.set['hosts'] = [{ ip: '127.0.0.1', hostname: 'test.com' }]
        end.converge 'hosts::default'
      end

      it 'should call the LWRP definition for hostsfile' do
        Chef::Recipe.any_instance.should_receive(:hostsfile_entry).with '127.0.0.1'
        chef_run
      end
    end
  end
end
