# frozen_string_literal: true

require 'spec_helpers/cli'

RSpec.describe Fam::CLI::Add::Parents, :cli do
  subject(:add_parent) do
    exec_fam('add', 'parent', child_name, *parent_names)
  end

  let(:child_name) { 'Bart Simpson' }
  let(:parent_names) { ['Homer Simpson', 'Marge Simpson'] }

  context 'when the child and parent names are given' do
    it 'reports the parents were added' do
      expect(add_parent.output)
        .to include(child_name)
        .and include(*parent_names)
    end

    it_behaves_like 'a successful command'
  end

  context 'when all names are missing' do
    subject(:add_parent) do
      exec_fam('add', 'parent')
    end

    it_behaves_like 'a failed command'
  end
end
