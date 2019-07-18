require "openssl"
require "open-uri"

FetchWaitTimes = Struct.new(:consulate) do
  include Concerns::Service

  URI_HOST = "travel.state.gov"
  URI_PATH = "/content/travel/resources/database/database.getVisaWaitTimes.html"

  delegate :code, to: :consulate, prefix: true

  def uri
    URI::HTTPS.build(host: URI_HOST, path: URI_PATH, query: URI.encode_www_form(cid: consulate_code))
  end

  def doc
    @doc ||= Nokogiri::HTML(open(uri, ssl_verify_mode: OpenSSL::SSL::VERIFY_NONE))
  end

  def categories
    AppointmentWaitTimes::CATEGORIES
  end

  def wait_times
    categories.zip(doc.text.split(/\s*,\s*/).take(categories.size).map(&:to_i)).to_h
  end

  def call
    AppointmentWaitTimes.new(consulate: consulate, **wait_times)
  end
end
