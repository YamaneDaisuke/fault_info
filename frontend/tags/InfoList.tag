<InfoList>
  <virtual each="{ list }">
    <Info opts="{ this }"></Info>
  </virtual>

  <script>
   request = window.superagent
   var self = this

   request.get("/")
          .end(function(err, res) {
            self.list = Array.reverse(res.body.info)
            self.update()
          })
  </script>
</InfoList>
