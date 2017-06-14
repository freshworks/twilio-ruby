##
# This code was generated by
# \ / _    _  _|   _  _
#  | (_)\/(_)(_|\/| |(/_  v1.0.0
#       /       /

module Twilio
  module REST
    class Preview < Domain
      class HostedNumbers < Version
        class HostedNumberOrderList < ListResource
          ##
          # Initialize the HostedNumberOrderList
          # @param [Version] version Version that contains the resource
          # @return [HostedNumberOrderList] HostedNumberOrderList
          def initialize(version)
            super(version)

            # Path Solution
            @solution = {}
            @uri = "/HostedNumberOrders"
          end

          ##
          # Lists HostedNumberOrderInstance records from the API as a list.
          # Unlike stream(), this operation is eager and will load `limit` records into
          # memory before returning.
          # @param [hosted_number_order.Status] status The Status of this HostedNumberOrder.
          #   One of `received`, `pending-loa`, `carrier-processing`, `testing`, `completed`,
          #   `failed`, or `action-required`.
          # @param [String] phone_number An E164 formatted phone number hosted by this
          #   HostedNumberOrder.
          # @param [String] incoming_phone_number_sid A 34 character string that uniquely
          #   identifies the IncomingPhoneNumber resource created by this HostedNumberOrder.
          # @param [String] friendly_name A human readable description of this resource, up
          #   to 64 characters.
          # @param [String] unique_name Provides a unique and addressable name to be
          #   assigned to this HostedNumberOrder, assigned by the developer, to be optionally
          #   used in addition to SID.
          # @param [Integer] limit Upper limit for the number of records to return. stream()
          #                   guarantees to never return more than limit.  Default is no limit
          # @param [Integer] page_size Number of records to fetch per request, when not set will                      use
          #  the default value of 50 records.  If no page_size is                      defined
          #  but a limit is defined, stream() will attempt to read                      the
          #  limit with the most efficient page size,                      i.e. min(limit, 1000)
          # @return [Array] Array of up to limit results
          def list(status: nil, phone_number: nil, incoming_phone_number_sid: nil, friendly_name: nil, unique_name: nil, limit: nil, page_size: nil)
            self.stream(
                status: status,
                phone_number: phone_number,
                incoming_phone_number_sid: incoming_phone_number_sid,
                friendly_name: friendly_name,
                unique_name: unique_name,
                limit: limit,
                page_size: page_size
            ).entries
          end

          ##
          # Streams HostedNumberOrderInstance records from the API as an Enumerable.
          # This operation lazily loads records as efficiently as possible until the limit
          # is reached.
          # @param [hosted_number_order.Status] status The Status of this HostedNumberOrder.
          #   One of `received`, `pending-loa`, `carrier-processing`, `testing`, `completed`,
          #   `failed`, or `action-required`.
          # @param [String] phone_number An E164 formatted phone number hosted by this
          #   HostedNumberOrder.
          # @param [String] incoming_phone_number_sid A 34 character string that uniquely
          #   identifies the IncomingPhoneNumber resource created by this HostedNumberOrder.
          # @param [String] friendly_name A human readable description of this resource, up
          #   to 64 characters.
          # @param [String] unique_name Provides a unique and addressable name to be
          #   assigned to this HostedNumberOrder, assigned by the developer, to be optionally
          #   used in addition to SID.
          # @param [Integer] limit Upper limit for the number of records to return.                  stream()
          #  guarantees to never return more than limit.                  Default is no limit
          # @param [Integer] page_size Number of records to fetch per request, when                      not set will use
          #  the default value of 50 records.                      If no page_size is defined
          #                       but a limit is defined, stream() will attempt to                      read the
          #  limit with the most efficient page size,                       i.e. min(limit, 1000)
          # @return [Enumerable] Enumerable that will yield up to limit results
          def stream(status: nil, phone_number: nil, incoming_phone_number_sid: nil, friendly_name: nil, unique_name: nil, limit: nil, page_size: nil)
            limits = @version.read_limits(limit, page_size)

            page = self.page(
                status: status,
                phone_number: phone_number,
                incoming_phone_number_sid: incoming_phone_number_sid,
                friendly_name: friendly_name,
                unique_name: unique_name,
                page_size: limits[:page_size],
            )

            @version.stream(page, limit: limits[:limit], page_limit: limits[:page_limit])
          end

          ##
          # When passed a block, yields HostedNumberOrderInstance records from the API.
          # This operation lazily loads records as efficiently as possible until the limit
          # is reached.
          # @param [hosted_number_order.Status] status The Status of this HostedNumberOrder.
          #   One of `received`, `pending-loa`, `carrier-processing`, `testing`, `completed`,
          #   `failed`, or `action-required`.
          # @param [String] phone_number An E164 formatted phone number hosted by this
          #   HostedNumberOrder.
          # @param [String] incoming_phone_number_sid A 34 character string that uniquely
          #   identifies the IncomingPhoneNumber resource created by this HostedNumberOrder.
          # @param [String] friendly_name A human readable description of this resource, up
          #   to 64 characters.
          # @param [String] unique_name Provides a unique and addressable name to be
          #   assigned to this HostedNumberOrder, assigned by the developer, to be optionally
          #   used in addition to SID.
          # @param [Integer] limit Upper limit for the number of records to return.                  stream()
          #  guarantees to never return more than limit.                  Default is no limit
          # @param [Integer] page_size Number of records to fetch per request, when                       not set will use
          #  the default value of 50 records.                      If no page_size is defined
          #                       but a limit is defined, stream() will attempt to read the
          #                       limit with the most efficient page size, i.e. min(limit, 1000)
          def each
            limits = @version.read_limits

            page = self.page(
                page_size: limits[:page_size],
            )

            @version.stream(page,
                            limit: limits[:limit],
                            page_limit: limits[:page_limit]).each {|x| yield x}
          end

          ##
          # Retrieve a single page of HostedNumberOrderInstance records from the API.
          # Request is executed immediately.
          # @param [hosted_number_order.Status] status The Status of this HostedNumberOrder.
          #   One of `received`, `pending-loa`, `carrier-processing`, `testing`, `completed`,
          #   `failed`, or `action-required`.
          # @param [String] phone_number An E164 formatted phone number hosted by this
          #   HostedNumberOrder.
          # @param [String] incoming_phone_number_sid A 34 character string that uniquely
          #   identifies the IncomingPhoneNumber resource created by this HostedNumberOrder.
          # @param [String] friendly_name A human readable description of this resource, up
          #   to 64 characters.
          # @param [String] unique_name Provides a unique and addressable name to be
          #   assigned to this HostedNumberOrder, assigned by the developer, to be optionally
          #   used in addition to SID.
          # @param [String] page_token PageToken provided by the API
          # @param [Integer] page_number Page Number, this value is simply for client state
          # @param [Integer] page_size Number of records to return, defaults to 50
          # @return [Page] Page of HostedNumberOrderInstance
          def page(status: nil, phone_number: nil, incoming_phone_number_sid: nil, friendly_name: nil, unique_name: nil, page_token: nil, page_number: nil, page_size: nil)
            params = {
                'Status' => status,
                'PhoneNumber' => phone_number,
                'IncomingPhoneNumberSid' => incoming_phone_number_sid,
                'FriendlyName' => friendly_name,
                'UniqueName' => unique_name,
                'PageToken' => page_token,
                'Page' => page_number,
                'PageSize' => page_size,
            }
            response = @version.page(
                'GET',
                @uri,
                params
            )
            return HostedNumberOrderPage.new(@version, response, @solution)
          end

          ##
          # Retrieve a single page of HostedNumberOrderInstance records from the API.
          # Request is executed immediately.
          # @param [String] address_sid A 34 character string that uniquely identifies the
          #   Address resource that represents the address of the owner of this phone number.
          # @param [String] phone_number An E164 formatted phone number hosted by this
          #   HostedNumberOrder.
          # @param [hosted_number_order.Type] type The type of the phone_number. One of
          #   `local` or `tollfree`.
          # @param [String] iso_country The ISO country code of the phone_number.
          # @param [Boolean] sms_capability Used to specify that the SMS capability will be
          #   hosted on Twilio's platform.
          # @param [String] email Email of the owner of this phone number that is being
          #   hosted.
          # @param [String] account_sid Optional. The unique SID identifier of the Account
          #   or Sub-Account to create this HostedNumberOrder on.
          # @param [String] friendly_name Optional. A human readable description of this
          #   resource, up to 64 characters.
          # @param [String] unique_name Optional. Provides a unique and addressable name to
          #   be assigned to this HostedNumberOrder, assigned by the developer, to be
          #   optionally used in addition to SID.
          # @param [String] cc_emails Optional. A list of emails that LOA document for this
          #   HostedNumberOrder will be carbon copied to.
          # @param [String] sms_url Optional. The SMS URL attached to the
          #   IncomingPhoneNumber resource.
          # @param [String] sms_method Optional. The SMS Method attached to the
          #   IncomingPhoneNumber resource.
          # @param [String] sms_fallback_url Optional. The SMS Fallback URL attached to the
          #   IncomingPhoneNumber resource.
          # @param [String] sms_fallback_method Optional. The SMS Fallback Method attached
          #   to the IncomingPhoneNumber resource.
          # @return [HostedNumberOrderInstance] Newly created HostedNumberOrderInstance
          def create(address_sid: nil, phone_number: nil, type: nil, iso_country: nil, sms_capability: nil, email: nil, account_sid: nil, friendly_name: nil, unique_name: nil, cc_emails: nil, sms_url: nil, sms_method: nil, sms_fallback_url: nil, sms_fallback_method: nil)
            data = {
                'AddressSid' => address_sid,
                'PhoneNumber' => phone_number,
                'Type' => type,
                'IsoCountry' => iso_country,
                'SmsCapability' => sms_capability,
                'Email' => email,
                'AccountSid' => account_sid,
                'FriendlyName' => friendly_name,
                'UniqueName' => unique_name,
                'CcEmails' => cc_emails,
                'SmsUrl' => sms_url,
                'SmsMethod' => sms_method,
                'SmsFallbackUrl' => sms_fallback_url,
                'SmsFallbackMethod' => sms_fallback_method,
            }

            payload = @version.create(
                'POST',
                @uri,
                data: data
            )

            return HostedNumberOrderInstance.new(
                @version,
                payload,
            )
          end

          ##
          # Provide a user friendly representation
          def to_s
            '#<Twilio.Preview.HostedNumbers.HostedNumberOrderList>'
          end
        end

        class HostedNumberOrderPage < Page
          ##
          # Initialize the HostedNumberOrderPage
          # @param [Version] version Version that contains the resource
          # @param [Response] response Response from the API
          # @param [Hash] solution Path solution for the resource
          # @return [HostedNumberOrderPage] HostedNumberOrderPage
          def initialize(version, response, solution)
            super(version, response)

            # Path Solution
            @solution = solution
          end

          ##
          # Build an instance of HostedNumberOrderInstance
          # @param [Hash] payload Payload response from the API
          # @return [HostedNumberOrderInstance] HostedNumberOrderInstance
          def get_instance(payload)
            return HostedNumberOrderInstance.new(
                @version,
                payload,
            )
          end

          ##
          # Provide a user friendly representation
          def to_s
            '<Twilio.Preview.HostedNumbers.HostedNumberOrderPage>'
          end
        end

        class HostedNumberOrderContext < InstanceContext
          ##
          # Initialize the HostedNumberOrderContext
          # @param [Version] version Version that contains the resource
          # @param [String] sid A 34 character string that uniquely identifies this
          #   HostedNumberOrder.
          # @return [HostedNumberOrderContext] HostedNumberOrderContext
          def initialize(version, sid)
            super(version)

            # Path Solution
            @solution = {
                sid: sid,
            }
            @uri = "/HostedNumberOrders/#{@solution[:sid]}"
          end

          ##
          # Fetch a HostedNumberOrderInstance
          # @return [HostedNumberOrderInstance] Fetched HostedNumberOrderInstance
          def fetch
            params = {}

            payload = @version.fetch(
                'GET',
                @uri,
                params,
            )

            return HostedNumberOrderInstance.new(
                @version,
                payload,
                sid: @solution[:sid],
            )
          end

          ##
          # Deletes the HostedNumberOrderInstance
          # @return [Boolean] true if delete succeeds, true otherwise
          def delete
            return @version.delete('delete', @uri)
          end

          ##
          # Update the HostedNumberOrderInstance
          # @param [String] friendly_name A human readable description of this resource, up
          #   to 64 characters.
          # @param [String] unique_name Provides a unique and addressable name to be
          #   assigned to this HostedNumberOrder, assigned by the developer, to be optionally
          #   used in addition to SID.
          # @param [String] email Email of the owner of this phone number that is being
          #   hosted.
          # @param [String] cc_emails Optional. A list of emails that LOA document for this
          #   HostedNumberOrder will be carbon copied to.
          # @param [hosted_number_order.Status] status The Status of this HostedNumberOrder.
          #   User can only update this to `pending-loa`.
          # @return [HostedNumberOrderInstance] Updated HostedNumberOrderInstance
          def update(friendly_name: nil, unique_name: nil, email: nil, cc_emails: nil, status: nil)
            data = {
                'FriendlyName' => friendly_name,
                'UniqueName' => unique_name,
                'Email' => email,
                'CcEmails' => cc_emails,
                'Status' => status,
            }

            payload = @version.update(
                'POST',
                @uri,
                data: data,
            )

            return HostedNumberOrderInstance.new(
                @version,
                payload,
                sid: @solution[:sid],
            )
          end

          ##
          # Provide a user friendly representation
          def to_s
            context = @solution.map {|k, v| "#{k}: #{v}"}.join(',')
            "#<Twilio.Preview.HostedNumbers.HostedNumberOrderContext #{context}>"
          end
        end

        class HostedNumberOrderInstance < InstanceResource
          ##
          # Initialize the HostedNumberOrderInstance
          # @param [Version] version Version that contains the resource
          # @param [Hash] payload payload that contains response from Twilio
          # @param [String] sid A 34 character string that uniquely identifies this
          #   HostedNumberOrder.
          # @return [HostedNumberOrderInstance] HostedNumberOrderInstance
          def initialize(version, payload, sid: nil)
            super(version)

            # Marshaled Properties
            @properties = {
                'sid' => payload['sid'],
                'account_sid' => payload['account_sid'],
                'incoming_phone_number_sid' => payload['incoming_phone_number_sid'],
                'address_sid' => payload['address_sid'],
                'signing_document_sid' => payload['signing_document_sid'],
                'phone_number' => payload['phone_number'],
                'capabilities' => payload['capabilities'],
                'friendly_name' => payload['friendly_name'],
                'unique_name' => payload['unique_name'],
                'status' => payload['status'],
                'date_created' => Twilio.deserialize_iso8601(payload['date_created']),
                'date_updated' => Twilio.deserialize_iso8601(payload['date_updated']),
                'email' => payload['email'],
                'cc_emails' => payload['cc_emails'],
                'url' => payload['url'],
            }

            # Context
            @instance_context = nil
            @params = {
                'sid' => sid || @properties['sid'],
            }
          end

          ##
          # Generate an instance context for the instance, the context is capable of
          # performing various actions.  All instance actions are proxied to the context
          # @param [Version] version Version that contains the resource
          # @return [HostedNumberOrderContext] HostedNumberOrderContext for this HostedNumberOrderInstance
          def context
            unless @instance_context
              @instance_context = HostedNumberOrderContext.new(
                  @version,
                  @params['sid'],
              )
            end
            @instance_context
          end

          def sid
            @properties['sid']
          end

          def account_sid
            @properties['account_sid']
          end

          def incoming_phone_number_sid
            @properties['incoming_phone_number_sid']
          end

          def address_sid
            @properties['address_sid']
          end

          def signing_document_sid
            @properties['signing_document_sid']
          end

          def phone_number
            @properties['phone_number']
          end

          def capabilities
            @properties['capabilities']
          end

          def friendly_name
            @properties['friendly_name']
          end

          def unique_name
            @properties['unique_name']
          end

          def status
            @properties['status']
          end

          def date_created
            @properties['date_created']
          end

          def date_updated
            @properties['date_updated']
          end

          def email
            @properties['email']
          end

          def cc_emails
            @properties['cc_emails']
          end

          def url
            @properties['url']
          end

          ##
          # Fetch a HostedNumberOrderInstance
          # @return [HostedNumberOrderInstance] Fetched HostedNumberOrderInstance
          def fetch
            context.fetch
          end

          ##
          # Deletes the HostedNumberOrderInstance
          # @return [Boolean] true if delete succeeds, true otherwise
          def delete
            context.delete
          end

          ##
          # Update the HostedNumberOrderInstance
          # @param [String] friendly_name A human readable description of this resource, up
          #   to 64 characters.
          # @param [String] unique_name Provides a unique and addressable name to be
          #   assigned to this HostedNumberOrder, assigned by the developer, to be optionally
          #   used in addition to SID.
          # @param [String] email Email of the owner of this phone number that is being
          #   hosted.
          # @param [String] cc_emails Optional. A list of emails that LOA document for this
          #   HostedNumberOrder will be carbon copied to.
          # @param [hosted_number_order.Status] status The Status of this HostedNumberOrder.
          #   User can only update this to `pending-loa`.
          # @return [HostedNumberOrderInstance] Updated HostedNumberOrderInstance
          def update(friendly_name: nil, unique_name: nil, email: nil, cc_emails: nil, status: nil)
            context.update(
                friendly_name: friendly_name,
                unique_name: unique_name,
                email: email,
                cc_emails: cc_emails,
                status: status,
            )
          end

          ##
          # Provide a user friendly representation
          def to_s
            values = @params.map{|k, v| "#{k}: #{v}"}.join(" ")
            "<Twilio.Preview.HostedNumbers.HostedNumberOrderInstance #{values}>"
          end
        end
      end
    end
  end
end