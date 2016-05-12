function extract_words(path_to_file)

local word_list={}
local padrao="[\W_]+"
local texto_arquivo=""

if(not(type(path_to_file)=='string')or path_to_file==nil)then
return {}
end

local status,erro=pcall(function () arquivo = io.open(path_to_file,"r") texto_arquivo=arquivo:read("*all") end)

if(status)then

texto_arquivo=string.gsub(texto_arquivo,padrao," ")

for word in string.gmatch(texto_arquivo,"%a+") do
	table.insert(word_list,string.lower(word))
end

else
io.write(string.format("I/O error when opening {%s}: {%s}",path_to_file,erro))
return {}
end

return word_list
end
-------------------------------------------------------------------------------------------------------------------------------
function remove_stop_words(word_list)

local stop_words={}

if(not(type(word_list)=='table'))then
return {}
end

local status,erro=pcall(function () arquivo = io.open('../stop_words.txt',"r") for word in string.gmatch(arquivo:read("*all"),"([^,]+)") do table.insert(stop_words,word) end end)

if(status)then

for word in string.gmatch("a b c d e f g h i j k l m n o p q r s t u v w x y z","%a")do
table.insert(stop_words,word)
end


for key,word in ipairs(word_list) do
	for _,value in ipairs(stop_words) do
		if(value==word)then
		table.remove(word_list,key)
		break
		end
	end
end

return word_list

else
io.write(string.format("I/O error when opening ../stops_words.txt: {%s}",erro))
return word_list
end

end
----------------------------------------------------------------------------------------------------------------------------------
function frequencies(word_list)
if(not(type(word_list)=='table') or table.getn(word_list)==0)then
return {}
end
word_freqs={}
for key,word in ipairs(word_list)do
	if(not(word_freqs[word]==nil))then
		word_freqs[word]=word_freqs[word]+1
	else
		word_freqs[word]=1
	end
end
return word_freqs
end
---------------------------------------------------------------------------------------------------------------------------------
function sort(word_freq)
if(not(type(word_freq)=='table') or (function() for _ in pairs(word_freq) do count = count + 1 end return count end) == 0)then
return {}
end

local chaves={}
local retorno={}

for chave,value in pairs(word_freq) do
table.insert(chaves,chave)
end

table.sort(chaves,function(a,b) return word_freqs[a]>word_freqs[b] end)


return chaves
end
----------------------------------------------------------------------------------------------------------------------------------

filename = "../input.txt"

if(not(arg[1]==nill) and string.len(arg[1])>1)then
filename=arg[1]
end

word_freqs=frequencies(remove_stop_words(extract_words(filename)))
ordenacao_palavras=sort(word_freqs)

local index=1
while(index<26) do
palavra=ordenacao_palavras[index]
io.write(palavra.."-"..word_freqs[palavra].."\n")
index=index+1

end


