class Epics
  def epics_post(client, end_point, project_id, body)
    url = 'projects/' + project_id +'/'+ end_point
    code, body = client.post_request(url, body)
    [code, body]
  end

  def epics_delete(client, endpoint, project_id, epic_id)
    url =  'projects/' + project_id + '/' + endpoint + '/' + epic_id
    code, body = client.delete_request(url)
    # noinspection RubyUnnecessaryReturnValue
    [code, body]
  end

  def epics_get(client, endpoint, project_id)
    url = 'projects/' + project_id + '/' + endpoint
    code, body = client.get_request(url)
    [code, body]
  end

  def epics_put(client, endpoint, project_id, epic_id, body)
    url = 'projects/' + project_id + '/' + endpoint  + '/' + epic_id
    code, body = client.put_request(url, body)
    [code, body]
  end

  def epic_get(client, endpoint, project_id, epic_id)
    url = 'projects/' + project_id + '/' + endpoint + '/' + epic_id
    code, body = client.get_request(url)
    [code, body]
  end

end