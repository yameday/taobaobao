class ImgsearchesController < ApplicationController
  
  def index
  
  end
  
  def show
    @search = Imgsearch.find(params[:id])
    
    data_hash = JSON.parse(@search.result)
    @search123 = data_hash['mods']['itemlist']['data']['collections'][0]['auctions']
    
    @values = []
    @search123.each do |x|
        subarray = []
        subarray.push(x['raw_title'])
        subarray.push("https:" + x['pic_url'])
        subarray.push(x['view_price'])  
        subarray.push("https:" + x['detail_url'])
        @values.push(subarray)
    end
  
    @sortarry = @values.sort_by { |e| e[2].to_i }
    
  end
  
  
  def new
    @search = Imgsearch.new
  end
  
  def create
    
    @search = Imgsearch.new(search_params)
    imageurl = @search.photo.current_path
    
    #call_color(imageurl)
    ary_result = Hash.new
    ary_result = call_bao(@search.photo)
    
    @search.status = ary_result['status']
    @search.description = ary_result['description']
    
    taobao_url = ary_result['description']
    res_search = crewler_taobao(taobao_url)
   
    if @search.save
      
      redirect_to @search
    else
      render :action => :new
    end
  end
  
    
private  
  
  def search_params
    params.require(:imgsearch).permit(:photo)
  end
  
  def call_color(url_image)
     
        require 'rubygems'
        require 'json'
        require 'net/http/post/multipart'
       # abort(url)
        url = URI.parse('http://www.pictaculous.com/')
       
          req = Net::HTTP::Post::Multipart.new url.path,
             "upload" => UploadIO.new(File.new(url_image.current_path), url_image.content_type, url_image.filename)
             
          
          res = Net::HTTP.start(url.host, url.port) do |http|
            res1 = http.request(req)
            
             return_str = res1.body
             return_str = '{"status":1,"name":"TB1bIUKa8jTBKNjSZFDXXbVgVXa","url":"//g-search3.alicdn.com/img/bao/uploaded/i4/TB1bIUKa8jTBKNjSZFDXXbVgVXa","error":false}'
            obj = JSON.parse(return_str)
            taobao_upload_id = obj['name']
            taobao_url = obj['name']
            @search.description = res1.body
            
            ary = Hash.new 
            if taobao_upload_id
              # @search.status = 'OK'
              ary['status'] = 'OK'
              # @search.description = taobao_url
              ary['description'] = taobao_url
            else  
              ary['status'] = 'error'
              # @search.status = 'error'
              # @search.description = obj
              ary['description'] = obj
            end
           
          end
            
  end
  
  def call_bao(url_image)
     
        require 'rubygems'
        require 'json'
        require 'net/http/post/multipart'
       # abort(url)
        #url = URI.parse('http://www.pictaculous.com/')
        url = URI.parse('https://s.taobao.com/image')
          req = Net::HTTP::Post::Multipart.new url.path,
            # "upload" => UploadIO.new(File.new(url_image), "image/jpeg", "shoes.jpg")
             "imgfile" => UploadIO.new(File.new(url_image.current_path), url_image.content_type, url_image.filename)
          ary = Hash.new 
          res = Net::HTTP.start(url.host, url.port) do |http|
            res1 = http.request(req)
            
            return_str = res1.body
            obj = JSON.parse(return_str)
            taobao_upload_id = obj['name']
            toDateStr = Time.now.strftime("%Y%m%d")
            # die(datestr111)
            # datestr = Date.strptime("12/22/2011", "%m/%d/%Y")
            taobao_url = 'https://s.taobao.com/search?&imgfile=&js=1&stats_click=search_radio_all%3A1&initiative_id=staobaoz_'+ toDateStr +'&ie=utf8&tfsid='+ taobao_upload_id +'&app=imgsearch'
            
            
            if taobao_upload_id
              # @search.status = 'OK'
              ary['status'] = 'OK'
              # @search.description = taobao_url
              ary['description'] = taobao_url
            else  
              ary['status'] = 'error'
              # @search.status = 'error'
              # @search.description = obj
              ary['description'] = obj
            end
           
          end
    
          return ary
  end
  
  def crewler_taobao (url)
    
        require 'net/http'
        require 'json'
        begin
            # uri = URI('http://placekitten.com/')
          
            uri = URI(url)
            http = Net::HTTP.new(uri.host, uri.port)
          # puts  uri.path
          
            req = Net::HTTP::Post.new(url , 
              {
               # 'Content-Type' =>'application/json',  
                'Host' => 's.taobao.com',
                'Accept' => 'text/html,application/xhtml+xml,application/xml;q=0.9,image/webp,image/apng,*/*;q=0.8',
                # 'Accept-Encoding' => 'gzip, deflate, br',
                'Accept-Language' => 'zh-TW,zh;q=0.9,en-US;q=0.8,en;q=0.7',
                 'Referer' => 'https://s.taobao.com/search/?',
                'Connection' => 'keep-alive',
                'User-Agent' => 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_12_6) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/65.0.3325.162 Safari/537.36'
                
              })
            # req.body = {"pizza_type" => "Margherita", "pizza_no" => "2"}.to_json
            
            res = http.request(req)
            # puts  res.body
            # puts JSON.parse(res.body)
            k = res.body
           #str = k.force_encoding('GBK')  
              #variable = k.match(/var\s+req_var\s+=\s+(.*?);/m)[1]
            #variable = k.match(/current_palette\s+=\s+(.*?);/m)[1]
          variable = k.match(/g_page_config\s+=\s+(.*?);\n\s+g_srp_loadCss/m)[1]
          str = variable.force_encoding('GBK')  
          #str = variable.encode('UTF-8') 
           @search.result = str
           @search.result = JSON.parse(str).to_json
          
         # puts JSON.parse(variable)
          #  puts  str
          #binding.pry
        rescue => e
            puts "failed #{e}"
        end
  end
    
end
