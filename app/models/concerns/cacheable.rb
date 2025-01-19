require "active_support/concern"
require_relative "../../../lib/pipeline/configuration"

module Cacheable
  extend ActiveSupport::Concern
  def self.cache_ttl
    ::Pipeline.configuration.cache_ttl
  rescue
    100 # default cache ttl
  end

  included do
    # Add class-level cache configuration
    @cache_ttl = Cacheable.cache_ttl
  end

  def self.cache_ttl=(value)
    @cache_ttl = value
  end

  def store_in_cache(type, id, data, expires_in: self.class.cache_ttl)
    Rails.cache.write(
      cache_key(type, id),
      data,
      expires_in: expires_in
    )
  end

  def fetch_from_cache(type, id)
    Rails.cache.read(cache_key(type, id))
  end

  def delete_from_cache(type, id)
    Rails.cache.delete(cache_key(type, id))
  end

  def cache_key(type, id)
    "pipeline:#{self.class.name.downcase}:#{type}:#{id}"
  end
end
