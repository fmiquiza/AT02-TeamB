class Stories
    def self.stories_post(client, id_project, end_point, body)
      url = 'projects/' + id_project + '/' + end_point
      code, body = client.post_request(url, body)
      [code, body]
    end

    def self.stories_get(client, id_project, end_point)
      url = 'projects/' + id_project + '/' + end_point
      code = client.get_request(url)
      code
    end

    def self.stories_put(client, id_project, end_point, id_story, body)
      url = 'projects/' + id_project + '/' + end_point + '/' + id_story
      code, body = client.put_request(url, body)
      [code, body]
    end

    def self.stories_delete(client, id_project, end_point, id_story)
      url = 'projects/' + id_project + '/' + end_point + '/' + id_story
      code, body = client.delete_request(url)
      [code, body]
    end
end