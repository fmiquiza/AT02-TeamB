class Workspaces

  def self.workspaces_post(client, body)
    url = 'my/workspaces'
    code, body = client.post_request(url, body)
    [code, body]
  end

  def self.workspaces_get(client)
    end_point = 'my/workspaces'
    code, body = client.get_request(end_point)
    [code, body]
  end

  def self.workspaces_delete(client, workspace_id)
    url =  'my/workspaces/' + workspace_id
    code = client.delete_request(url)


    code
  end

  def self.workspaces_put(client, workspace_id,json)

    url = 'my/workspaces/' + workspace_id
       code, body = client.put_request(url, json)
    [code, body]
  end


end