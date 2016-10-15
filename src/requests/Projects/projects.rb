require_relative '../../../src/helpers/rest_client/api_rest_client'

class Projects
  def self.project_post(client,json)
    url='projects/'
    code, body = client.post_request(url, json)
    [code, body]
  end

  def self.project_get(client)
    url = 'projects/'
    code, body = client.get_request(url)
    [code, body]
  end

  def self.project_put(client,json,id_project)
    url = 'projects/' + id_project.to_s
    code, body = client.put_request(url, json)
    [code, body]
  end

  def self.project_get_by_id(client,id_project)
    url = 'projects/' + id_project.to_s
    code, body = client.get_request(url)
    [code, body]
  end

  def self.project_delete(client,id_project)
    url= 'projects/' + id_project.to_s
    code = client.delete_request(url)
    code
  end
end