require 'rspec'

$count1=0
describe 'let' do
  let(:count) { $count1 += 1 }

  it 'passes the first example' do
    expect(1).to eq(1)
  end

  it 'should be 1 in second example' do
    expect(count).to eq(1)
  end
end

$count2=0
describe 'let!' do
  let!(:count) { $count2 += 1 }

  it 'passes the first example' do
    expect(1).to eq(1)
  end

  it 'should be 2 in the second example' do
    expect(count).to eq(2)
  end

end