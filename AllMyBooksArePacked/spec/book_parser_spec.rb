require 'spec_helper'

RSpec.describe BookParser do
  describe '#parse' do
    it 'should get a nokogiri document and apply the RuleSet' do
      book_parser = BookParser.new(['data/book1.html', 'data/book2.html'])
      rules = double('rules')
      allow(RuleSet).to receive(:new).and_return(rules)
      allow(rules)
        .to receive(:apply_rule_set)
        .and_return(expected_result[0], expected_result[1])
      expect(book_parser.parse).to eq(expected_result)
    end
  end

  def expected_result
    [
      {
        title: 'Zealot: The Life and Times of Jesus of Nazareth',
        author: 'Reza Aslan',
        price: 16.89,
        weight: 1.2,
        isbn_10: '140006922X'
      },
      {
        title: 'Pacific Rim: Man, Machines, and Monsters',
        author: 'David S Cohen',
        price: '17.17',
        weight: 3.2,
        isbn_10: '1608871827'
      }
    ]
  end
end
