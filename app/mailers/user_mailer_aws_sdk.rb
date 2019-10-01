class UserMailerAwsSdk < ActionMailer::Base
  require 'aws-sdk'

  default :from => "recipehound2019@gmail.com"

  def registration_confirmation_aws(user)
    @user = user

    sender = "recipehound2020@gmail.com"
    recipient = "riseabove428@gmail.com"

    configsetname = "ConfigSet"

    awsregion = "us-west-2"

    subject = "Amazon SES test (AWS SDK for Ruby)"

    htmlbody =
      "<h1>Hi #{@user.first_name},</h1>"\
      '<p>Thanks for registering! To confirm your registration click the URL below.'\
      "#{confirm_email_user_url(@user.confirm_token)}"\

    textbody = "This email was sent with Amazon SES using the AWS SDK for Ruby."

    encoding = "UTF-8"

    # Create a new SES resource and specify a region
    ses = Aws::SES::Client.new(region: awsregion)

    # Try to send the email.
    begin

      # Provide the contents of the email.
      resp = ses.send_email({
        destination: {
          to_addresses: [
            recipient,
          ],
        },
        message: {
          body: {
            html: {
              charset: encoding,
              data: htmlbody,
            },
            text: {
              charset: encoding,
              data: textbody,
            },
          },
          subject: {
            charset: encoding,
            data: subject,
          },
        },
      source: sender,
      # Comment or remove the following line if you are not using
      # a configuration set
      configuration_set_name: configsetname,
      })
      puts "Email sent!"

    # If something goes wrong, display an error message.
    rescue Aws::SES::Errors::ServiceError => error
      puts "Email not sent. Error message: #{error}"
    end
  end
end
