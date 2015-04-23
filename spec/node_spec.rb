require 'spec_helper'

RSpec.describe Node do
	let(:node) { Node.new('foo') }

	describe '#initialize' do
		it 'instantiates a node with a value' do
			expect(node).to be_a Node
		end
	end

	describe '#value' do
		it "retrieves a node's value" do
			expect(node.value).to eq 'foo'
		end
	end

	describe '#add' do
		let(:first_node) { Node.new('foo') }
		let(:second_node) { Node.new('bar') }

		it 'adds a node to a node' do
			expect {
				first_node.add(second_node)
			}.not_to raise_exception
		end
	end

	describe '#next' do
		let(:first_node) { Node.new('foo') }
		let(:second_node) { Node.new('bar') }

		context 'two nodes' do
			before { first_node.add(second_node) }

			it "retrieves a node's next node" do
				expect(first_node.next).to eq second_node
			end
		end

		context 'three nodes' do
			let(:third_node) { Node.new('foobar') }

			before do
				first_node.add(second_node)
				second_node.add(third_node)
			end

			it 'traverses the whole list' do
				expect(first_node.next.next).to eq third_node
			end
		end
	end
end
