(($) ->
  class FilePreview
    constructor: (element) ->
      @dataKey = "file-preview"
      @defaults = width: 150
      @options = @_options(element)

      @_bind()

    _bind: ->
      $("body").on "change", "[data-" + @dataKey + "]", (e) =>
        @_show(e.target)

    _show: (input) ->
      if input.files and input.files[0]
        reader = new FileReader

        reader.onload = (e) =>
          @_image(input)
            .attr("src", e.target.result)
            .attr("width", @options.width)

          $(@options.remove_selector)
            .trigger("remove-#{@options.selector}:reset")

        reader.readAsDataURL input.files[0]

    _image: (input) =>
      $("#" + @options.selector)

    _options: (input) ->
      $.extend @defaults, $(input).data(@dataKey)

  $.fn.filePreview = ->
    return unless @length
    new FilePreview(this)

) jQuery
