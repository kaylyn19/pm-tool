require 'rails_helper'

RSpec.describe ProjectsController, type: :controller do
    def current_user 
        @current_user ||= FactoryBot.create(:user)
    end

    describe '#new' do
        context 'with no user signed in' do
            it 'redirects to the sign in page' do
                get :new
                expect(response).to redirect_to new_sessions_path
            end
        end

        context 'with user signed in' do
            before do
                session[:user_id] = current_user.id
            end

            it 'requires an instance variable' do
                get :new
                expect(assigns(:project)).to be_a_new(Project)
            end

            it 'renders the project new page' do
                get :new
                expect(response).to render_template :new 
            end
        end
    end

    describe '#create' do
        context 'with no user signed in' do
            it 'redirects to the sign in page' do
                post :create, params: {project: FactoryBot.attributes_for(:project)}
                expect(response).to redirect_to new_sessions_path
            end
        end

        context 'with user signed in' do
            before do
                session[:user_id] = current_user.id
            end

            context 'invalid parameter' do
                before do
                    post :create, params: {project: FactoryBot.attributes_for(:project, title: nil)}
                end

                it 'flashes an alert message' do
                    expect(flash[:alert]).to be
                end

                it 'renders the new template' do
                    expect(response).to render_template :new
                end
            end

            context 'valid parameter' do
                def valid_request
                    post :create, params: {project: FactoryBot.attributes_for(:project)}
                end

                it 'redirects to the show page' do
                    valid_request
                    expect(response).to redirect_to project_path(Project.last)
                end

                it 'creates a new project in db' do
                    count_before = Project.count
                    valid_request
                    count_after = Project.count
                    expect(count_after).to eq(count_before + 1)
                end
            end
        end
    end

    describe '#show' do
        # it 'renders the show page' do
        #     project = FactoryBot.create(:project)
        #     get :show, params: {id: project.id}
        #     expect(response).to redirect_to project_path(project.id)
        # end

        # it 'instantiates the task variable' do
        #     project = FactoryBot.create(:project)
        #     get :show, params: {id: project.id}
        #     expect(assigns(:project)).to be_a_new(Project)
        # end
    end

    describe '#index' do
        it 'renders the index page in a desc order of projects by created_at' do
            project_1 = FactoryBot.create(:project)
            project_2 = FactoryBot.create(:project)
            get :index
            expect(assigns(:project)).to eq([project_2, project_1])
        end

        it 'instantiates the variable' do
        end
    end

    describe '#destroy' do
        contest 'with no user signed in' do
            it 'redirects the user to the sign in page' do
            end
        end

        context 'with user signed in' do
            it 'removes the project from db' do
            end

            it 'redirects to the index page' do
            end
        end
    end

    describe '#edit' do
        it 'renders the edit page' do
        end
    end

    describe '#update' do
        context 'invalid parameter' do
            it 'renders the edit page' do
            end
        end

        context 'valid parameter' do
            it 'successfully updates the project in db' do
            end

            it 'flashes the updated message' do
            end
        end
    end

end
