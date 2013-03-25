module Ronductor

	class SearchLight

		def initialize(email, api_key, url)
			@email = email
			@api_key = api_key
			@url = url
		end

		def generate_signature(path, method, date)
			data = Array.new
			data.push(method)
			content = ""
			content_md5 = Digest::MD5.hexdigest(content)
			data.push(content_md5)
			data.push("application/json")
			data.push(date)
			data.push(path)
			data = data.join("\n")
			digest  = OpenSSL::Digest::Digest.new('sha1')
			sha1_string = OpenSSL::HMAC.digest(digest, @api_key, data)
			signature = Base64.encode64(sha1_string).to_s.chomp("\n")
			return "CSA "<< @email << ":" << signature
		end

		def headers(path, method)

			date = Time.now.utc
			date = date.strftime("%a, %d %b %Y %H:%M:%S %Z")
			headers = {
				"Authorization" => generate_signature(path, method, date),
				"Content-Type" => "application/json",
				"Date" => date
			}

		end

		def send_request(path, method = "GET")
			request = HTTPI::Request.new
			request.url = @url + path
			request.headers = headers(path, method)
			request.auth.ssl.verify_mode = :none
			if(method == 'GET')
				response = HTTPI.get(request)
			else
				response = HTTPI.post(request)
			end
			if response.code == 200
				response
			else
				nil
			end
		end
	end
end