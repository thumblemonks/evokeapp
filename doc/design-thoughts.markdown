# System responsibilities

## evokeapp.com

* Create account

Given a login

* Manage/view account details
* Create bucket
* Manage/view bucket details
* Delete bucket

## api.evokeapp.com

Given an api-key

* Get list of buckets

Given api-key + bucket-name

* Create task
* Update task
* Delete task
* Get aggregated statistics

# Document design

## Accounts collection

    Account : {
      name : string,
      email : string,
      api-key : guid,
      buckets : [
        Bucket : { name : string (unique to api-key) }
      ]
    }

## Tasks collection

    Task : {
      ref-id : id-to-bucket,
      status: some-state thing (pending, completed, failed, ...),
      url: string,
      http-method: string,
      schedule: nil or {second:*, minute:*, hour:*, day:* ...}
      ...,
      attempts:integer
    }

Do we need DJ for this at all? Let's find something else. Resque is redis based. Do we want to mix it up?