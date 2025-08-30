shared_examples "has status code 200" do |body: false|
  it "has status code 200" do
    subject

    expect(response.status).to eq 200
  end
end


shared_examples 'successful rendered' do |template_name, **options|
  it 'works' do
    if template_name.kind_of?(Array)
      template_name.each do |name|
        is_expected.to render_template("#{name}")
      end
    else
      is_expected.to render_template("#{template_name}")
    end
  end
end

