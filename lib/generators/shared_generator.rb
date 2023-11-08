# lib/generators/shared_generator.rb
class SharedGenerator < Rails::Generators::Base
  source_root File.expand_path('templates', __dir__)

  def create_shared_files
    template 'shared_user.html.erb', 'app/views/shared/shared_view.html.erb'
    template 'shared_partial.html.erb', 'app/views/shared/_shared_post.html.erb'
    template 'shared_partial.html.erb', 'app/views/shared/_shared_comments.html.erb'
    template 'shared_partial.html.erb', 'app/views/shared/_shared_likes.html.erb'
  end
end
