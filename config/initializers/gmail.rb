ActionMailer::Base.smtp_settings = {
  :enable_starttls_auto => true,
  :address        => 'smtp.gmail.com',
  :port           => 587,
  :domain         => 'localhost',
  :authentication => :plain,
  :user_name      => 'lsmgpacalculator@gmail.com',
  :password       => 'pl34s3d0nth4ckm3'
}
