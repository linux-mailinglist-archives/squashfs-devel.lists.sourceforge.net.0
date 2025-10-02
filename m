Return-Path: <squashfs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+squashfs-devel@lfdr.de
Delivered-To: lists+squashfs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id B1AE8BB4DCD
	for <lists+squashfs-devel@lfdr.de>; Thu, 02 Oct 2025 20:15:51 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.sourceforge.net; s=beta; h=Content-Type:Reply-To:From:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:Subject:
	MIME-Version:Message-ID:Date:To:Sender:Cc:Content-Transfer-Encoding:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=YkIdEyLx1xIyJOKhLNog6Kmly70zoyHytNC5WZ/g710=; b=NFE2ieP5bURYhWoccxaaeOL8XR
	7QoWvj7Ex2S6iq/hh3M1hrbH/WDC1V7V5uxl48HkoN/Hv45X+XM1soMHQu5z7aOCFRXJyLOBHNmM1
	tphdBx+rKpgNujG2D/w5FXuvhiA8hryHtJwyJWLp3tvztuiaW87qG8pDccU/zctBvG+Q=;
Received: from [127.0.0.1] (helo=sfs-ml-3.v29.lw.sourceforge.com)
	by sfs-ml-3.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <squashfs-devel-bounces@lists.sourceforge.net>)
	id 1v4Nq8-0000HX-LS;
	Thu, 02 Oct 2025 18:15:40 +0000
Received: from [172.30.29.66] (helo=mx.sourceforge.net)
 by sfs-ml-3.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <jamesmui@cisco.com>) id 1v4Nq7-0000HR-UH
 for squashfs-devel@lists.sourceforge.net;
 Thu, 02 Oct 2025 18:15:40 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=MIME-Version:Content-Type:Message-ID:Date:Subject:
 To:From:Sender:Reply-To:Cc:Content-Transfer-Encoding:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:In-Reply-To:References:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=Qa2e0UHMlZIsbxJrSY1DxtNcJxnT3RAY6YvxbCG/+Sc=; b=i3HafFDjczos4kdeKsPPw6crCe
 T7sZ9zYNranO6z5pxFcb4Za8f3I7IWxnFOTHrIGY9DfFmQ0b1ePb14qM/fv3NwJnkk5Siue0kkhw0
 V+D3t3pHJOVnmSYgBajpJjJs0LkQibsYYSP4wj2IXr7y5LJeI7PBhTgqW5JMl35nbtGQ=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=MIME-Version:Content-Type:Message-ID:Date:Subject:To:From:Sender:Reply-To
 :Cc:Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
 Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:
 References:List-Id:List-Help:List-Unsubscribe:List-Subscribe:List-Post:
 List-Owner:List-Archive; bh=Qa2e0UHMlZIsbxJrSY1DxtNcJxnT3RAY6YvxbCG/+Sc=; b=V
 TrLs1tJq4xF0ounjOOfu6uO2mClDABQkvgQV6ii1issV8LwvgmOAZVgdv5QJSQmbAR6VYPx8/aSmb
 cJ096Tw17ldd9LYuGqraGn1WgleRx4qNxqih9EWQDCT6tworEU14J7K/XlIwU8RsqxWK5SBwB/plH
 O+0RNRiSUkxNXgsg=;
Received: from alln-iport-7.cisco.com ([173.37.142.94])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.95)
 id 1v4Nq7-0005Hc-5m for squashfs-devel@lists.sourceforge.net;
 Thu, 02 Oct 2025 18:15:39 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=cisco.com; i=@cisco.com; l=2926; q=dns/txt;
 s=iport01; t=1759428939; x=1760638539;
 h=from:to:subject:date:message-id:mime-version;
 bh=Qa2e0UHMlZIsbxJrSY1DxtNcJxnT3RAY6YvxbCG/+Sc=;
 b=X+IeDtm1lg0Br3UfA4FkRgrO1339Bw7jExc2Bj5vHDooEhhsZnprkcRP
 nnSjZn04xxV9PCigk8YQsfA+oXEW0iiF1po2GVE2KuA+Lp9BmXRkDxHHy
 qVUfZg9jiG4swB30SkWCMUs5jX8cfftF7Lg1xaAeONEhKPA7KRNENQdo6
 TJtyf1FzAMrtcT77N3BtZxJk2jXwgQ2GH+5fiSVHGsmFAWI9Iwo6wlp8O
 LB25cGk3wZRKN2XHHhoTxQ0y8uHfiKeOSOABVEMpb3ze8M92qbEpGaL2x
 v8Dm5+9P8PwxMyPJmhS+Ph+c/wA7zccouryCQCrfU9F9erWRRboIAVObu g==;
X-CSE-ConnectionGUID: FH8opKaxTa2ADAydQpz9sQ==
X-CSE-MsgGUID: FibTJWKzSImCdxdLmWVt9A==
X-IPAS-Result: =?us-ascii?q?A0A+AAAavN5o/5QQJK1aHQEBAQEJARIBBQUBQCWBGggBC?=
 =?us-ascii?q?wGBPDFSB3uBChKIaQOETV+GVZlnhleBfw8BAQENAlEEAQGFBwKMRgImNAkOA?=
 =?us-ascii?q?QIEAQEBAQMCAwEBAQEBAQEBAQEBCwEBBQEBAQIBBwWBDhOGUAyGc3kBDHMPE?=
 =?us-ascii?q?AgEGxqCYYIdVQMBAqNLAYFAAooreIE0gQHgJoFJAYhQASqBNIEBg1SEMCcbg?=
 =?us-ascii?q?UlEgVeHa4QTgi8EgiKBAhQdn2SBRCIDJjMsAVUTFwsHBSaBPQMqNDFuMh2BJ?=
 =?us-ascii?q?4ULggCCHitPhQI6XoNTEhJrDwaBFYNahwKCag9bgRQDC209NxQbBQSBNQWXT?=
 =?us-ascii?q?ReDQC2nEqN2CoQcog0XqmuGQIFwg0KBNItgIqh0AgQCBAUCEAEBBoFoPIFZc?=
 =?us-ascii?q?BU7gmhRGQ/VcYE0AgcLAQEDCZNnAQE?=
IronPort-PHdr: A9a23:kLiD8hGs3o7AUKzS1tdjS51GfhMY04WdBeZdwpMjj7QLdbys4NG+e
 kfe/v5qylTOWNaT5/FFjr/Ourv7ESwb4JmHuWwfapEESRIfiMsXkgBhSM6IAEH2NrjrOgQxH
 d9JUxlu+HTTDA==
IronPort-Data: A9a23:dLyipa8BHhrACy1SEdr8DrUD3H+TJUtcMsCJ2f8bNWPcYEJGY0x3y
 TdLWzvXO6qJamKmL99ybtyx8hlS6sLTm9UxQAE6rCFEQiMRo6IpJzg2wmQcns+2BpeeJK6yx
 5xGMrEsFOhtEDmE4E3ra+G7xZVF/fngbqLmD+LZMTxGSwZhSSMw4TpugOdRbrRA2bBVOCvT/
 4qiyyHjEAX9gWMtajpOs/nrRC5H5ZwehhtJ5jTSWtgT1LPuvyF9JI4SI6i3M0z5TuF8dsamR
 /zOxa2O5WjQ+REgELuNyt4XpWVTH9Y+lSDX4pZnc/DKbipq/0Te4Y5nXBYoUnq7vh3S9zxHJ
 HqhgrTrIeshFvWkdO3wyHC0GQkmVUFN0OevzXRSLaV/wmWeG0YAzcmCA2kYHd0f4sV+EV1Hr
 9U0ASEBVwiR1vmPlefTpulE3qzPLeHiOIcZ/3UlxjbDALN/GNbIQr7B4plT2zJYasJmRKmFI
 ZFHL2MxKk2cM3WjOX9PYH46tOWhg3TkdiBZgFmUvqEwpWPUyWSd1ZCwbouFJIfWGJQ9ckCwi
 GPMw0bGIQMhFdm0xSqJ1neTuPOetHauMG4VPPjinhJwu3WI33EaEx0YTh63rOe0jma6WslDM
 AoP/Tc0pqU881akQ5/7UgHQnZKflhcYX9wVF6gx7xuAj/ONpQ2YHWMDCDVGbbTKqfMLeNDj7
 XfQ9/vBDj10u7rTQnWYnop4ZxvrUcTJBQfuvRM5cDY=
IronPort-HdrOrdr: A9a23:adzZOK2OKKIYOKtdAYTyJwqjBfhxeYIsimQD101hICG9Lfbo9P
 xGzc566farslcssSkb6K290cm7LU80hqQFnbX5XI3SFjUO11HYV72KgbGSpwEIeBeOu9K1t5
 0QCZSWYeeYZTMV/KSKhTVQeOxQpuVvhZrY/ds2uE0dND2CBZsQiDtRO0KwKGEzbg9AApYyCZ
 qb4eR6hxfIQx4qR/X+LEMoG8zYqfP2tL+OW3M77hgchzWmvHeN0vrXAhKY1hARX3dk2rE561
 XIlAT/++GKr+y74gW07R6d071m3P/ajvdTDs2FjcYYbh/2jByzWYhnU7qe+BgoveCU7kowmt
 WkmWZvAy0z0QKRQoiGm2qv5+DS6kdt15Yk8y7cvZLXm724eNv9MbsEuWsWSGqf16NqhqAC7E
 sC5RPmi3MQN2KNoMw4jOK4Di2DUSGP0DwfuP9WgHpFXYQEbrhN6YQZ4UNOCZ8FWDn38YY9DY
 BVfYjhDdttACSnhkrizx9S6c3pWm52EgaNQ0AEtMDQ2z9KnGphx09dwMAEhH8P+J80VpEBvo
 3/Q+9VvaALStVTYbN2Be8HT8fyAmvRQQjUOGbXJVj8DqkIN3/Etpay6rQo4+OhfoAO0fIJ6d
 z8eUIdsXR3d1PlCMWI0pEO+hfRQH+lVTCo0c1a74gRgMyJeFMqC1z3dLkDqbrTnxxEOLyqZ9
 +jfJZNR+TuJWHyGYBPxWTFKuhvwFElIb4ohuo=
X-Talos-CUID: =?us-ascii?q?9a23=3AaIQ8y2plK63BuCMHWyrv5VfmUe4FInrF737AH0b?=
 =?us-ascii?q?iIEpAWbGsUU3B45oxxg=3D=3D?=
X-Talos-MUID: 9a23:wpAxwwk4QYX9d7e9FIDadnpMNc1UwZuNGnsslL4Kq8WgMBNOJ2a02WE=
X-IronPort-Anti-Spam-Filtered: true
Received: from alln-l-core-11.cisco.com ([173.36.16.148])
 by alln-iport-7.cisco.com with ESMTP/TLS/TLS_AES_256_GCM_SHA384;
 02 Oct 2025 17:59:47 +0000
Received: from alln-opgw-4.cisco.com (alln-opgw-4.cisco.com [173.37.147.252])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by alln-l-core-11.cisco.com (Postfix) with ESMTPS id D2A11180003B4
 for <squashfs-devel@lists.sourceforge.net>;
 Thu,  2 Oct 2025 17:59:46 +0000 (GMT)
X-CSE-ConnectionGUID: dMNwD/ggRTiASCxQ7Dn3Cg==
X-CSE-MsgGUID: xCVUYdtdRqev8Rc44tDoPQ==
Authentication-Results: alln-opgw-4.cisco.com;
 dkim=pass (signature verified) header.i=@cisco.com
X-IronPort-AV: E=Sophos;i="6.18,310,1751241600"; d="scan'208,217";a="55726283"
Received: from mail-sj0pr08cu00101.outbound.protection.outlook.com (HELO
 SJ0PR08CU001.outbound.protection.outlook.com) ([40.93.1.73])
 by alln-opgw-4.cisco.com with ESMTP/TLS/TLS_AES_256_GCM_SHA384;
 02 Oct 2025 17:59:46 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=fuq1tiLRUenDgsMW/mR6VJ7wskmgow5fj5HEJaoR/qtMl7shuSFQG8GgUUForZHpOd3/+wSukwQeFKHVcY70rAY6dXS9RhslBUUM6sK26pTwuHXdgPX7mevKlQb2IUIyhoxkhn5gwli4Xzd9EgQLqtHj3W5epq+wVzisIq4x75CgBlbcSqmZPAUbCn3dkeRhr+B+i7wQo5BVEAwnLGLD66n+pwNaZTgw9JWD4uaFKvl5ztj6+OO5qwBn41zkyYWWWgrleYilEBkbeKwjzkB5U4BkQkT/XMxkqn2FLD5JXA44hUwYCLK2Vqe/ADhxAEKqmBFSc10EuZCIoLC6Xzbluw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Qa2e0UHMlZIsbxJrSY1DxtNcJxnT3RAY6YvxbCG/+Sc=;
 b=G77nF1D6n/yBf9zWkt5sOLBALjueDtSD9PBC728JUFnkI74DgPraAwvJ7NLyiQHr3dFNx0svAnUIucEW6qt+0qdy44QbQ6K1Z+kUbmre3nRVVABqj6frcjT0FCZzD++/HGsoS0yOdtqaTIAGWie35bUhCWhbXzJFcQcxJ+2WgnlJzTvS3LQnMv7BKhNPdQlCaHl2X6Coz3B+xsf2iEg3U1ZQ7u9aXcS+fxdf7gZWVbE98bfNRM8j+xZpiY09cIjbJkb+evpedPNaqg65czTyGCxFNlAYfUXa5YTVA1HWWyicsYmbeP2bAXKpY4zrlKzI02eXwEu+ZZHAnOM7SLLEKA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=cisco.com; dmarc=pass action=none header.from=cisco.com;
 dkim=pass header.d=cisco.com; arc=none
Received: from SA2PR11MB5115.namprd11.prod.outlook.com (2603:10b6:806:118::22)
 by BL1PR11MB5256.namprd11.prod.outlook.com (2603:10b6:208:30a::10)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9160.18; Thu, 2 Oct
 2025 17:59:40 +0000
Received: from SA2PR11MB5115.namprd11.prod.outlook.com
 ([fe80::e60c:a611:172e:6926]) by SA2PR11MB5115.namprd11.prod.outlook.com
 ([fe80::e60c:a611:172e:6926%7]) with mapi id 15.20.9182.015; Thu, 2 Oct 2025
 17:59:39 +0000
To: "squashfs-devel@lists.sourceforge.net"
 <squashfs-devel@lists.sourceforge.net>
Thread-Topic: sort order  
Thread-Index: AQHcM8DAYhQ3uFLl7ESnrpq67Gnyqg==
Date: Thu, 2 Oct 2025 17:59:20 +0000
Message-ID: <SA2PR11MB51159D1C0E36E819F0060C43C1E7A@SA2PR11MB5115.namprd11.prod.outlook.com>
Accept-Language: en-CA, en-US
Content-Language: en-CA
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-ms-reactions: allow
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: SA2PR11MB5115:EE_|BL1PR11MB5256:EE_
x-ms-office365-filtering-correlation-id: a2cbe43a-4048-4415-86f6-08de01dd753c
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
 ARA:13230040|366016|376014|1800799024|8096899003|38070700021; 
x-microsoft-antispam-message-info: =?Windows-1252?Q?48hfFz5eqPH5bkRDGX/iklzXfd72lbsmVknpMNvaBlLX6NAqLkPYre5G?=
 =?Windows-1252?Q?klziHr64zBNreazpkc4t6td7M7KQCZUFHiWWFZFHZJizXUNQ6SckWXLt?=
 =?Windows-1252?Q?Q8NB4+bpHxgfNVQEBmXLe18RCdyjbfZX9RrwhfjUliHsAmQ8DpGMA4Qm?=
 =?Windows-1252?Q?osHCRw5k0HceDJf7Nr0tnHedBmFJlxzodeOIoxZ32X1t8ymCDwHRLGuE?=
 =?Windows-1252?Q?U9lcSZkJWLpuFxu3M8qA21JFzK1Qb0vk7632oMRULukDAOQZV09lqw3V?=
 =?Windows-1252?Q?vQ0cF7SyAhjNscXG54I4an0s4Pz2swDukIQSCtzhIA68PfH+/IMBpMmR?=
 =?Windows-1252?Q?0zghVleaqVE1gznh6xw0EsVSDMa/np6mQMpKMeFqE/2WB74oETqTt4EK?=
 =?Windows-1252?Q?+0Wps6Oe7/+C7hqkrvGapXtzeow3OOOzg9YrcluwIFt9nbSi4y2CYU7a?=
 =?Windows-1252?Q?8dC73g7dk1EQ/HufSFop0CRn98DQ49BSvcwH5kPMsngSjUGENTKmYUVd?=
 =?Windows-1252?Q?oCDs7rHkSfTN5lgWpBiL9QtNYBeEScSdbYOC9JQB51s8BLZVta4Od8T5?=
 =?Windows-1252?Q?jK3mrTwVKzm1Yp/1jFKt7LcpCMU6DsVl7KBdYp1FvLvU1DT1H/tZy+EX?=
 =?Windows-1252?Q?aMJ7iQB/0rCSBasATKkxPmxbwWXM1JBXX1WvI5c9OA9rxEdtVlJEOE3D?=
 =?Windows-1252?Q?boLt129U8SmHANk/2pC/oPKvkwQkmHCHVlMhuOH6Xk/llfI7ha7JGkxp?=
 =?Windows-1252?Q?JBtrulzBCDumWa9vJmXZUihk+MDAN9tBmk2VB35Zve2m2h/GLEGy4/r4?=
 =?Windows-1252?Q?+ZHoOYi0qvOyGkMzzoCvHJmGPDfv0xZrK31iljI8+qU6A8uNKnMdXkZO?=
 =?Windows-1252?Q?qS0N2YbJdgOFQf2O880vCC4/JGmqU2kW1b7GA8fmQw5EmX8KuC1dnf3i?=
 =?Windows-1252?Q?NGNlqpsrdolytTEshNwcoKL/7D7ZO7SgUbUqRqN7Ti2UEoltB88f+Jxd?=
 =?Windows-1252?Q?2yWinmpyYM67Yb+xtOIKi+cHLnWXAza0JaTNzVp4aqSI0Pfzl70q8Po4?=
 =?Windows-1252?Q?XbUnboTvLp6rSsZZ3wjJxmVnmd5dyGL/F4taM9CklGx1SDpnwF0C/8VY?=
 =?Windows-1252?Q?sn/Z7x2g3pZkOdU3rir43vw83d4bBuk/TIkwfLTb15bl1Q5LSBH+ovQ2?=
 =?Windows-1252?Q?UVYkQb5IP+/VxLvkHilwv6b8b9Tj+4g1cQo8UvVTX+uuuJBoE+ijChpn?=
 =?Windows-1252?Q?BL5/o/QKCo3WYDfUNILM+X3aGXa/HCH5oOr1LDeX9WsoWYFmfYX3Aj0B?=
 =?Windows-1252?Q?xPY2Vzkzb5NebPT4aoRFbrbVMzRK2qrsPcwrXUvx8xd1V3finFBNSi9a?=
 =?Windows-1252?Q?U8Ikhy6cqt6A3AeuzsfbqZwSMMRPMvce5m6lQFXxhKysGfpATrfd/QXg?=
 =?Windows-1252?Q?Glhqi2XiXxqYhyeE4C7N3u4gINLG4UY0uiTU89GJwJUCdOk8kiOGoeYx?=
 =?Windows-1252?Q?Eo+psRxBe7mLrlu7axZL2PIWhOIdKMisoM36R/Bd4ZWPkGIW3skMXeyb?=
 =?Windows-1252?Q?sNBrijRPFqMrNoZ5mkmh5hU/6CKnm3s+uzD6+A9h1T4NP4lXVJn9Em6Y?=
 =?Windows-1252?Q?jZDl5lkglsVTihZq2OcF4RgD?=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:SA2PR11MB5115.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(376014)(1800799024)(8096899003)(38070700021); DIR:OUT;
 SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?Windows-1252?Q?Zlrb+UbTx09BQZ22B3WXjM721OUIXTF5FY/9YzTQTi1qKSYDK9c886e0?=
 =?Windows-1252?Q?MAm2b1kqAK83vtgOeQSyAGpW9cDRt1hPsh9HpXZKL66IA33dgL4wnj6s?=
 =?Windows-1252?Q?xBIuJGkFRbxYUNhFda6SPnmqkUe2p6l869AxjFiVNJcQ7USLpzTXTDbr?=
 =?Windows-1252?Q?E+OWjC+rkmVNFsiVj3lJt3jgt9U0gt6lcef2WhSuF3YpyoZyVNEGsUMp?=
 =?Windows-1252?Q?EUoHSCm0HhKNM3mWfKTugHypXGvMit3sGraiE6qyoEMRskz/yRnUIekj?=
 =?Windows-1252?Q?K1opAuRDusG2Ag5bobuwno+dAUYiykxCpgNHTSosFBbgBMNK//RXOz8I?=
 =?Windows-1252?Q?gvacL0JYCyYdzI3M10Oio4wDSG1Am0YRYiGRwwv1sfffUNGUEhKXv+wn?=
 =?Windows-1252?Q?Zoy58+bj8kSid1nT/YvyJhzRRp+GpYyVwjf3r9enZd4EaPQYJUqAfcE2?=
 =?Windows-1252?Q?cNLtnPoSlCKp5dSFwXFqqsy5W12mmvwEfSLrlUeX5Fdrr5wqLmfc8B+/?=
 =?Windows-1252?Q?YaBjzHdinXpkb3Vd7xT7NwkTRLIRlrDPlSTBHnBxVsj01vRJTkMD7Crv?=
 =?Windows-1252?Q?5e6aUHnxDD+p2lNw0uCxcpLAQzxorBwKw/U+iRyqJizc2RVaRvnD+sN2?=
 =?Windows-1252?Q?VNJ8bZTq294NfBYXsNRfPVoKA9GhdLZvFzkbpcz4tp5Voz5phwDItRxE?=
 =?Windows-1252?Q?RjQnikJ70looPh3DnrZVxG1/hUY181O0eJHsgTu5LQL4jJMrJ1op9i+L?=
 =?Windows-1252?Q?vxayvAdYd0Zj8cqh2KKbyTqp+413HpnvXuNSEGiYZh7aDpQQyn/d1is5?=
 =?Windows-1252?Q?iI+86UuUm7CljarjEJU+OQCUULh2+BIM9J6FM+SH0MNcVnyrDyTOMU7u?=
 =?Windows-1252?Q?v0NXrwnD0xEUyWtXKLN8rl36H3dDJiTLBFxaNkREnhX0zssNftSm+oh8?=
 =?Windows-1252?Q?0IMEOjUc7BrRhKJYDQcagKb79ys4uBujmmJxrRIrD8yadcV+ccKtxjWL?=
 =?Windows-1252?Q?aq+RVGmBFz4FXRCZW4W/SuEnrEtrY9L9LYSs+d8QNIxBSjwHyMyetYCS?=
 =?Windows-1252?Q?PFf9wB+qpv1OiYcX6qaV9dLfvzjNEOXs+sMzf7DamNJNxKEXffBnkSHu?=
 =?Windows-1252?Q?WpFeS4Seumbc/Ui6RGRQnpEa87nZykNrXqS6ntYDc7exeqj/bH1u2UEQ?=
 =?Windows-1252?Q?EmEXOMDvT5sxQKsJFkrLHxkN2S0x88K57yEurqBmUxpqb3kcU/cX62dm?=
 =?Windows-1252?Q?h1LqsvszEdw/Sqtzg2/GxCXMFVI+8mhvh6grWkXcPbAO8q9WhddpCL3w?=
 =?Windows-1252?Q?JP6l7vlK7DjRFxSIimBHmQSie0pP+FjO1MOFNkMFgquwpcCoafpbkAiL?=
 =?Windows-1252?Q?75hFIP/dcQ9u8fRQPvK6xW1EC1/TBdpQZjaEiV8PAHWLpB9i1WGjY6md?=
 =?Windows-1252?Q?s5J9tApGecrPd8uPz0UnDSwtX4ILxwMIfg2GN3D78mCoIOdoH8AsXgfj?=
 =?Windows-1252?Q?p/WxcYEfm5lq+D1EXcjnqu9X0cXgBW8DRO+caByjqjkhjpT+DOXf6jyr?=
 =?Windows-1252?Q?mvSUFihSUS4n7DNyPurCP4lC71+yhKI28ZH7Ia40UzZrAU6wCFGkpX1u?=
 =?Windows-1252?Q?33PPuzP0/WA3p7WW7+pdgVZZXo7hwkvkdufsb/hqpkfhgW795suGDyIc?=
 =?Windows-1252?Q?I8nVoYd0a6LJbEVM/Emi6QjDnw6EiHsq?=
MIME-Version: 1.0
X-OriginatorOrg: cisco.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: SA2PR11MB5115.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: a2cbe43a-4048-4415-86f6-08de01dd753c
X-MS-Exchange-CrossTenant-originalarrivaltime: 02 Oct 2025 17:59:39.9048 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 5ae1af62-9505-4097-a69a-c1553ef7840e
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: /DS+3VNQUJpRgI7cxNUG1XwFKdGpfHJDP4NN0dGDVUAC49ckl2jaVJvk8dGvqYokAfwXMnvo3FVZ7g/LN9hjUg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BL1PR11MB5256
X-Outbound-SMTP-Client: 173.37.147.252, alln-opgw-4.cisco.com
X-Outbound-Node: alln-l-core-11.cisco.com
X-Spam-Score: -7.7 (-------)
X-Spam-Report: Spam detection software, running on the system "sfi-spamd-1.hosts.colo.sdot.me",
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 
 Content preview:  Is there a convenient way to recover the sort-order that was
    used to create a squashfs archive? “unsquashfs -ls foo.sqsh” does not
    give the sort-order. It appears to walk the directory tree and outputs the
    filenames in that order. 
 
 Content analysis details:   (-7.7 points, 5.0 required)
 
  pts rule name              description
 ---- ---------------------- --------------------------------------------------
 -7.5 USER_IN_DEF_DKIM_WL    From: address is in the default DKIM welcome-list
 -0.1 DKIM_VALID_AU          Message has a valid DKIM or DK signature from author's
                             domain
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
                             envelope-from domain
  0.0 ARC_VALID              Message has a valid ARC signature
 -0.1 DKIM_VALID             Message has at least one valid DKIM or DK signature
  0.0 ARC_SIGNED             Message has a ARC signature
  0.1 DKIM_SIGNED            Message has a DKIM or DK signature, not necessarily valid
  0.0 RCVD_IN_MSPIKE_H4      RBL: Very Good reputation (+4)
                             [173.37.142.94 listed in wl.mailspike.net]
  0.0 HTML_MESSAGE           BODY: HTML included in message
  0.0 RCVD_IN_MSPIKE_WL      Mailspike good senders
 -0.0 DKIMWL_WL_MED          DKIMwl.org - Medium trust sender
 -0.0 DKIMWL_WL_HIGH         DKIMwl.org - High trust sender
X-Headers-End: 1v4Nq7-0005Hc-5m
Subject: [Squashfs-devel] sort order
X-BeenThere: squashfs-devel@lists.sourceforge.net
X-Mailman-Version: 2.1.21
Precedence: list
List-Id: <squashfs-devel.lists.sourceforge.net>
List-Unsubscribe: <https://lists.sourceforge.net/lists/options/squashfs-devel>, 
 <mailto:squashfs-devel-request@lists.sourceforge.net?subject=unsubscribe>
List-Archive: <http://sourceforge.net/mailarchive/forum.php?forum_name=squashfs-devel>
List-Post: <mailto:squashfs-devel@lists.sourceforge.net>
List-Help: <mailto:squashfs-devel-request@lists.sourceforge.net?subject=help>
List-Subscribe: <https://lists.sourceforge.net/lists/listinfo/squashfs-devel>, 
 <mailto:squashfs-devel-request@lists.sourceforge.net?subject=subscribe>
From: "James Muir \(jamesmui\) via Squashfs-devel"
 <squashfs-devel@lists.sourceforge.net>
Reply-To: "James Muir \(jamesmui\)" <jamesmui@cisco.com>
Content-Type: multipart/mixed; boundary="===============3661464211711193734=="
Errors-To: squashfs-devel-bounces@lists.sourceforge.net

--===============3661464211711193734==
Content-Language: en-CA
Content-Type: multipart/alternative;
	boundary="_000_SA2PR11MB51159D1C0E36E819F0060C43C1E7ASA2PR11MB5115namp_"

--_000_SA2PR11MB51159D1C0E36E819F0060C43C1E7ASA2PR11MB5115namp_
Content-Type: text/plain; charset="Windows-1252"
Content-Transfer-Encoding: quoted-printable

Is there a convenient way to recover the sort-order that was used to create=
 a squashfs archive?

=93unsquashfs -ls foo.sqsh=94 does not give the sort-order.  It appears to =
walk the directory tree and outputs the filenames in that order.

If I could list the offset to the first data block with each filename, then=
 that would reveal the sort order.

-James M

--_000_SA2PR11MB51159D1C0E36E819F0060C43C1E7ASA2PR11MB5115namp_
Content-Type: text/html; charset="Windows-1252"
Content-Transfer-Encoding: quoted-printable

<html xmlns:o=3D"urn:schemas-microsoft-com:office:office" xmlns:w=3D"urn:sc=
hemas-microsoft-com:office:word" xmlns:m=3D"http://schemas.microsoft.com/of=
fice/2004/12/omml" xmlns=3D"http://www.w3.org/TR/REC-html40">
<head>
<meta http-equiv=3D"Content-Type" content=3D"text/html; charset=3DWindows-1=
252">
<meta name=3D"Generator" content=3D"Microsoft Word 15 (filtered medium)">
<style><!--
/* Font Definitions */
@font-face
	{font-family:"Cambria Math";
	panose-1:2 4 5 3 5 4 6 3 2 4;}
@font-face
	{font-family:Aptos;
	panose-1:2 11 0 4 2 2 2 2 2 4;}
/* Style Definitions */
p.MsoNormal, li.MsoNormal, div.MsoNormal
	{margin:0cm;
	font-size:12.0pt;
	font-family:"Aptos",sans-serif;
	mso-ligatures:standardcontextual;}
span.EmailStyle17
	{mso-style-type:personal-compose;
	font-family:"Aptos",sans-serif;
	color:windowtext;}
.MsoChpDefault
	{mso-style-type:export-only;}
@page WordSection1
	{size:612.0pt 792.0pt;
	margin:72.0pt 72.0pt 72.0pt 72.0pt;}
div.WordSection1
	{page:WordSection1;}
--></style>
</head>
<body lang=3D"EN-CA" link=3D"#467886" vlink=3D"#96607D" style=3D"word-wrap:=
break-word">
<div class=3D"WordSection1">
<p class=3D"MsoNormal"><span style=3D"font-size:11.0pt">Is there a convenie=
nt way to recover the sort-order that was used to create a squashfs archive=
?<o:p></o:p></span></p>
<p class=3D"MsoNormal"><span style=3D"font-size:11.0pt"><o:p>&nbsp;</o:p></=
span></p>
<p class=3D"MsoNormal"><span style=3D"font-size:11.0pt">=93unsquashfs -ls f=
oo.sqsh=94 does not give the sort-order.&nbsp; It appears to walk the direc=
tory tree and outputs the filenames in that order.<o:p></o:p></span></p>
<p class=3D"MsoNormal"><span style=3D"font-size:11.0pt"><o:p>&nbsp;</o:p></=
span></p>
<p class=3D"MsoNormal"><span style=3D"font-size:11.0pt">If I could list the=
 offset to the first data block with each filename, then that would reveal =
the sort order.<o:p></o:p></span></p>
<p class=3D"MsoNormal"><span style=3D"font-size:11.0pt"><o:p>&nbsp;</o:p></=
span></p>
<p class=3D"MsoNormal"><span style=3D"font-size:11.0pt">-James M <o:p></o:p=
></span></p>
</div>
</body>
</html>

--_000_SA2PR11MB51159D1C0E36E819F0060C43C1E7ASA2PR11MB5115namp_--


--===============3661464211711193734==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline


--===============3661464211711193734==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
Squashfs-devel mailing list
Squashfs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/squashfs-devel

--===============3661464211711193734==--

