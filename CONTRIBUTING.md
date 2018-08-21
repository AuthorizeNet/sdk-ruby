+ Thanks for contributing to the Authorize.Net Ruby SDK.

+ Before you submit a pull request, we ask that you consider the following:

     - Submit an issue to state the problem your pull request solves or the funtionality that it adds. We can then advise on the feasability of the pull request, and let you know if there are other possible solutions.
     - Part of the SDK is auto-generated based on the XML schema. Due to this auto-generation, we cannot merge contributions for request or response classes. You are welcome to open an issue to report problems or suggest improvements. Auto-generated classes include all classes in [lib/authorize_net/api/schema.rb](https://github.com/AuthorizeNet/sdk-ruby/tree/master/lib/authorize_net/api)  and [lib/authorize_net/api/transaction.rb](https://github.com/AuthorizeNet/sdk-ruby/tree/master/lib/authorize_net/api) folders, except [lib/authorize_net/api/api_transaction.rb](https://github.com/AuthorizeNet/sdk-ruby/tree/master/lib/authorize_net/api).
     - Files marked as deprecated are no longer supported. Issues and pull requests for changes to these deprecated files will be closed.
     - Recent changes will be in [the future branch](https://github.com/AuthorizeNet/sdk-ruby/tree/future). Before submitting an issue or pull request, check the future branch first to see if a fix has already been merged.
     - **Always use the future branch for pull requests.** We will first merge pull requests to the future branch, before pushing to the master branch for the next release.