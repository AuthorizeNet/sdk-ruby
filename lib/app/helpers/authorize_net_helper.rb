# The Authorize.Net Rails Helper module. Provides methods to assist with integrating the various APIs.

module AuthorizeNetHelper
  # Generates a collection of hidden form fields (as a raw HTML string) for a AuthorizeNet::SIM::Transaction
  # (sim_transaction). You can specify any html_options that hidden_field_tag accepts, and the
  # hidden fields will be built with those options.
  def sim_fields(sim_transaction, html_options = {})
    fields = sim_transaction.form_fields.collect do |k, v|
      if v.is_a? Array
        v.collect { |val| hidden_field_tag(k, val, html_options) }
      else
        hidden_field_tag(k, v, html_options)
      end
    end
    fields.flatten!
    field_str = fields.join("\n")
    if field_str.respond_to?(:html_safe)
      return field_str.html_safe
    else
      return field_str
    end
  end
end
