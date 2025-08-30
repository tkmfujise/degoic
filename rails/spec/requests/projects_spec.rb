require 'rails_helper'

RSpec.describe "/projects", type: :request do
  describe "GET /projects" do
    subject { get projects_path, params: params }
    let(:params) { {} }

    it_behaves_like 'successful rendered', %w[
      projects/index
    ]
  end


  describe "GET /projects/:id" do
    subject { get project_path(project), params: params }
    let(:params) { {} }
    let(:project) { create :project }

    it_behaves_like 'successful rendered', %w[
      projects/show
    ]
  end


  describe "GET /projects/new" do
    subject { get new_project_path, params: params }
    let(:params) { {} }

    it_behaves_like 'successful rendered', %w[
      projects/new
      projects/_form
    ]
  end


  describe "GET /edit" do
    subject { get edit_project_path(project), params: params }
    let(:params) { {} }
    let(:project) { create :project }

    it_behaves_like 'successful rendered', %w[
      projects/edit
      projects/_form
    ]
  end


  describe "POST /projects" do
    subject { post projects_path, params: params }
    let(:params) {
      {
        project: {
          name: 'Test'
        }
      }
    }
    let(:project) { Project.last }

    it 'works' do
      expect{ subject }.to change(Project, :count).by(1)
      expect(project.name).to eq params[:project][:name]
      is_expected.to redirect_to(project_url(project))
    end
  end


  describe "PUT /projects/:id" do
    subject { put project_path(project), params: params }
    let(:params) {
      {
        project: {
          name: 'Updated'
        }
      }
    }
    let!(:project) { create :project }

    it 'works' do
      expect{ subject }.not_to change(Project, :count)
      expect(project.reload.name).to eq params[:project][:name]
      is_expected.to redirect_to(project_url(project))
    end
  end


  describe "DELETE /projects/:id" do
    subject { delete project_path(project), params: params }
    let(:params) { {} }
    let!(:project) { create :project }

    it 'works' do
      expect{ subject }.to change(Project, :count).by(-1)
      expect{ project.reload }.to raise_error(ActiveRecord::RecordNotFound)
      is_expected.to redirect_to(projects_url)
    end
  end
end
