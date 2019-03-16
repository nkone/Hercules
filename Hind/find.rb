# **************************************************************************** #
#                                                                              #
#                                                         :::      ::::::::    #
#    find.rb                                            :+:      :+:    :+:    #
#                                                     +:+ +:+         +:+      #
#    By: phtruong <marvin@42.fr>                    +#+  +:+       +#+         #
#                                                 +#+#+#+#+#+   +#+            #
#    Created: 2019/03/15 15:39:42 by phtruong          #+#    #+#              #
#    Updated: 2019/03/15 18:24:34 by phtruong         ###   ########.fr        #
#                                                                              #
# **************************************************************************** #

require "oauth2"

UID = "589483e3bb76521369e97ef339aba2abb0ed7806b57a4c0296060500d3799508"
SECRET = "9ddea9446805ced815823ee64b333b2dc72c24ceb7f0cb43f0912f91d862f8ad"
$client = OAuth2::Client.new(UID, SECRET, site: "https://api.intra.42.fr")
$token = $client.client_credentials.get_token

def ifind(user_id)
	begin
		response = $token.get("/v2/users/#{user_id}/locations/")
		unless response.status == 200
			puts ("Server you're trying to connect to might currently be down (╯°□°)╯︵ ┻━┻")
			sleep(4.20)
		end
		if !response.parsed[0]["end_at"]
			puts (user_id + " is sitting @ " + response.parsed[0]["host"])
		else
			puts (user_id + " isn't here;" + \
				  " last seen @ " + response.parsed[0]["host"] + \
				  " on " + response.parsed[0]["end_at"][0..9] + \
				  " at " + response.parsed[0]["end_at"][11..15])
		end
	rescue
		puts (user_id + " is not a valid user, please update your friends list")
	end
end

File.open('friends.txt').each do |line|
	ifind("#{line.chomp}")
end

#ifind("phtruong")

