import XCTest
@testable import LibStringy

class String_DataDetectorTests: XCTestCase {

    // MARK: -  Web URL

    func test_webURLs() throws {
        var str = """
        Et est voluptatibus dolorem minus unde. Consequatur magnam veritatis consequuntur
        quam commodi provident id exercitationem ea esse labore. Eos dolorem aut odio.
        """
        XCTAssertTrue(str.webURLs().isEmpty)

        str = """
        Autem fugiat quibusdam ad fugit quia nesciunt http://www.example.com/product?id=1&page=2 asperiores expedita
        ducimus enim sit earum voluptatem consequatur http://255.255.255.255 dolore. Alias est eveniet at itaque
        doloremque et optio https://www.onxmaps.com/hunt/app deleniti quo. Exercitationem delectus maiores quod.
        """
        XCTAssertEqual(
            [
                "http://www.example.com/product?id=1&page=2",
                "http://255.255.255.255",
                "https://www.onxmaps.com/hunt/app"
            ],
            str.webURLs()
        )

        str = "Quia est non sit example.com asperiores consequatur."
        XCTAssertTrue(str.webURLs().contains("http://example.com"))
    }

    func test_isWebUrl() throws {
        XCTAssertTrue("http://www.example.com".isWebUrl)
        XCTAssertTrue("https://www.example.com".isWebUrl)
        XCTAssertTrue("http://blog.example.com".isWebUrl)
        XCTAssertTrue("http://www.example.com/product".isWebUrl)
        XCTAssertTrue("http://www.example.com/product?id=1&page=2".isWebUrl)
        XCTAssertTrue("http://www.example.com#up".isWebUrl)
        XCTAssertTrue("http://www.example.com:8000".isWebUrl)
        XCTAssertTrue("http://www.example".isWebUrl)

        XCTAssertFalse("www.example.com".isWebUrl)
        XCTAssertFalse("example.com".isWebUrl)
        XCTAssertFalse(" http://www.example.com".isWebUrl)
        XCTAssertFalse("http://www.example.com ".isWebUrl)
        XCTAssertFalse("".isWebUrl)
        XCTAssertFalse(" ".isWebUrl)

        XCTAssertTrue("http://255.255.255.255".isWebUrl)
        XCTAssertFalse("htp://255.255.255.255".isWebUrl)
        XCTAssertFalse("255.255.255.255".isWebUrl)

        XCTAssertFalse("http://www.💩.com".isWebUrl)
        XCTAssertFalse("http://www.example.com/💩".isWebUrl)
        XCTAssertFalse("http://www.example.com?.poop=💩".isWebUrl)
        XCTAssertFalse("http://www.\u{1F4A9}.com".isWebUrl)
        XCTAssertTrue("http://www.xn--ls8h.com".isWebUrl)
    }

    // MARK: -  Email Address

    func test_emailAddresses() throws {
        var str = """
        Aut et laudantium assumenda est quaerat. Repellat quia reprehenderit eos numquam vitae consequuntur
        dolorem sunt vel natus magnam quia facere.
        """
        XCTAssertTrue(str.emailAddresses().isEmpty)

        str = """
        Perspiciatis reiciendis hello@example.com quasi autem fugiat. Autem hello+you@example.com deserunt
        neque repellat nope@example .com est velit est omnis hello @example.com non molestiae.
        """
        XCTAssertEqual(
            [
                "hello@example.com",
                "hello+you@example.com",
            ],
            str.emailAddresses()
        )

    }

    func test_isEmailAddress() throws {
        // Just some relatively simple sanity checks
        
        XCTAssertTrue("hello@example.com".isEmailAddress)
        XCTAssertTrue("hello.you@example.com".isEmailAddress)
        XCTAssertTrue("hello+you@example.com".isEmailAddress)
        XCTAssertTrue("hello@example.co.nz".isEmailAddress)
        XCTAssertTrue("hello@example.com.nz".isEmailAddress)
        XCTAssertTrue("666@example.com".isEmailAddress)
        XCTAssertTrue("h.e.l.l.o@example.com".isEmailAddress)
        XCTAssertTrue("h-e-l-l-o@example.com".isEmailAddress)
        XCTAssertTrue("h_e_l_l_o@example.com".isEmailAddress)


        XCTAssertFalse("hello_at_example.com".isEmailAddress)
        XCTAssertFalse("hello@example".isEmailAddress)
        XCTAssertFalse("@example.com".isEmailAddress)
        XCTAssertFalse("👹@example.com".isEmailAddress)
        XCTAssertFalse("hello @example.com".isEmailAddress)
        XCTAssertFalse("hello@ example.com".isEmailAddress)
        XCTAssertFalse(" hello @example.com".isEmailAddress)
        XCTAssertFalse("hello @example.com ".isEmailAddress)
        XCTAssertFalse(" hello@@example.com".isEmailAddress)
        XCTAssertFalse(" hello@example..com".isEmailAddress)
    }

    // MARK: -  Phone Number

    func test_phoneNumbers() throws {
        var str = """
        This 80’s classic dedicated to Jenny, whose name and number were written on a wall, has the infectious chorus
        that had us all singing and dialing 867-5309. There is mystery behind the number as one of the songwriters,
        Jim Keller, says that Jenny was very much a real person, and the other songwriter, Alex Call, said there was
        never any Jenny and that the name and number just came to him out of nowhere. Regardless of whether or not
        Jenny actually existed, the song caused many Americans unlucky enough to have the 867-5309 number to disconnect
        their phone lines in order to stop the constant calls looking for Jenny.
        """
        XCTAssertEqual(["867-5309", "867-5309"], str.phoneNumbers())

        str = """
        In the I Love Lucy episode "The Girls Want to Go to a Nightclub" (1951), Lucy dials up Sam Zabaglione, at
        Plaza 52099 (755-2099).

        In 1966 Wilson Pickett recorded "634-5789 (Soulsville, U.S.A.)", which also appears in the soundtrack of the
        movie Blues Brothers 2000. It has been covered by multiple artists including Tina Turner and Ry Cooder.

        In the 1992 film Sneakers the NSA agent Mary gives her telephone number as (415) 273-9164.

        In 2014, Russian snowboarder Alexey Sobolev received over two thousand text messages within a few days after
        printing mobile phone number +7-9250222285 on a helmet worn during the Winter Olympics in Sochi, Russia.
        """
        XCTAssertEqual(
            [
                "755-2099",
                "634-5789",
                "(415) 273-9164",
                "+7-9250222285"
            ],
            str.phoneNumbers()
        )
    }

    func test_isPhoneNumber() throws {
        XCTAssertTrue("867-5309".isPhoneNumber)
        XCTAssertTrue("867 5309".isPhoneNumber)
        XCTAssertTrue("867.5309".isPhoneNumber)
        XCTAssertTrue("+1 (800) 867-5309".isPhoneNumber)
        XCTAssertTrue("(800) 867-5309".isPhoneNumber)
        XCTAssertTrue("1 (800) 867-5309".isPhoneNumber)
        XCTAssertTrue("(011) 154-123-4567".isPhoneNumber)

        XCTAssertFalse("666".isPhoneNumber)
        XCTAssertFalse("8675309".isPhoneNumber)
        XCTAssertFalse("800.867-53092".isPhoneNumber)
    }

    static var allTests = [
        ("test_webURLs", test_webURLs),
        ("test_isWebUrl", test_isWebUrl),
        ("test_emailAddresses", test_emailAddresses),
        ("test_isEmailAddress", test_isEmailAddress),
        ("test_phoneNumbers", test_phoneNumbers),
        ("test_isPhoneNumber", test_isPhoneNumber),
    ]
}
