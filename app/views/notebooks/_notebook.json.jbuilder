json.extract! notebook, :id, :userid, :stkcode, :datme, :category, :fmt, :fileurl, :created_at, :updated_at
json.url notebook_url(notebook, format: :json)
