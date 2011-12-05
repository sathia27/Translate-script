#!/usr/bin/env ruby
=begin
Program name: Translation script
Date Written: 05/12/2011
Date Modified: 05/12/2011
Author : Sathianarayanan.S
License: GPL2.0
Version: 1.0
=end
begin
    require 'rubygems'
    require 'nokogiri'
    require 'open-uri'
    require 'net/http'
    require 'uri'
    require 'prawn'
    if ARGV[0]
        puts "converting file '"+ARGV[0]+"' to tamil version!!!"
        resume = File.open(ARGV[0]);
        total_text = ""
        resume.each do |str|
            total_text += str
        end
        page = Nokogiri::HTML(open(URI.parse(URI.encode("http://translate.google.com/?langpair=en|ta&text=#{total_text}"))))
        puts resume.readlines 
        result = page.search("#result_box")
        Prawn::Document.generate("output.pdf") do
            font "ttf-tamil-fonts/TAMu_Kalyani.ttf"
            text result.text, :size => 20
        end
    else
        puts "Enter file name. Filename can be .doc or .txt \n[Usage] ruby translate.rb filename.doc"
    end 
end
