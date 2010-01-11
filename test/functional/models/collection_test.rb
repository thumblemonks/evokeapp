require 'teststrap'

rails_context Collection do
  set :transactional, true

  hookup do
    topic.name = "foo-bar"
    topic.save!
  end

  context "retrieved using a key" do
    setup { Collection["foo-bar"] }

    asserts_topic.kind_of(Collection)
    asserts(:new_record?).not!
    asserts(:name).equals("foo-bar")
  end # retrieved using a key
  
  asserts("retrieval when no record found for key is") { Collection["bar-baz"] }.nil
end # rails Collection
