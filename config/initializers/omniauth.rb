Rails.application.config.middleware.use OmniAuth::Builder do
  provider :facebook, '351283208226652', 'edbb77fcf84269dd1cb7de8c1bdf5e7e', :scope => 'email, offline_access, read_stream, user_status, user_photos'
  provider :google_apps, :domain => "vinsol.com"
  provider :google_oauth2, '3597086569.apps.googleusercontent.com', 'V5m3to4zI6nsHhv2d_QJC9dU'
  
end  

