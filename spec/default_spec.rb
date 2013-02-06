require 'spec_helper'

describe 'phantomjs::default' do
  context 'on ubuntu' do
    before{ Fauxhai.mock(platform:'ubuntu') }
    let(:runner){ ChefSpec::ChefRunner.new.converge('phantomjs::default') }

    it 'should install the correct packages' do
      runner.should install_package 'fontconfig'
      runner.should install_package 'libfreetype6'
    end
  end

  context 'on centos' do
    before{ Fauxhai.mock(platform:'centos') }
    let(:runner){ ChefSpec::ChefRunner.new.converge('phantomjs::default') }

    it 'should install the correct packages' do
      runner.should install_package 'fontconfig'
      runner.should install_package 'freetype'
    end
  end

  let(:runner) do
    ChefSpec::ChefRunner.new do |node|
      node.override['phantomjs']['version'] = '1.8.1'
      node.automatic['kernel']['machine'] = 'x86_64'
    end.converge('phantomjs::default')
  end

  it 'should symlink the binary to /usr/bin' do
    runner.should create_link '/usr/bin/phantomjs'
    runner.link('/usr/bin/phantomjs').should link_to('/opt/phantomjs-1.8.1-linux-x86_64/bin/phantomjs')
  end
end
