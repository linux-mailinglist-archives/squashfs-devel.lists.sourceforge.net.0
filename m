Return-Path: <squashfs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+squashfs-devel@lfdr.de
Delivered-To: lists+squashfs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 04AD0520B04
	for <lists+squashfs-devel@lfdr.de>; Tue, 10 May 2022 04:10:17 +0200 (CEST)
Received: from [127.0.0.1] (helo=sfs-ml-1.v29.lw.sourceforge.com)
	by sfs-ml-1.v29.lw.sourceforge.com with esmtp (Exim 4.94.2)
	(envelope-from <squashfs-devel-bounces@lists.sourceforge.net>)
	id 1noFKD-0003z5-7L; Tue, 10 May 2022 02:10:09 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-1.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.94.2)
 (envelope-from <prvs=2127e39853=xiongwei.song@windriver.com>)
 id 1nniUG-0002As-Ne
 for squashfs-devel@lists.sourceforge.net; Sun, 08 May 2022 15:06:21 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=MIME-Version:Content-Transfer-Encoding:Content-Type
 :Message-ID:Date:Subject:CC:To:From:Sender:Reply-To:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:In-Reply-To:References:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=czRpmkdLFj2dU8soGIByve4jBKOCypuLbdF86yim2eg=; b=dQ3c21eBRm2YAOUskeiJxfgU/Y
 MrsRxmgVGP1yk7ogEuwy/uhFoTPK+8Rw+RndE0Uc6o5Al+Q/RpgUjgOHXP6TJYHyNwEfAYceSK1VQ
 pU0IhLYIQBZzyXlpgJ+5cFoxHlYAS7msv9niuv2nMvMeDwVBo429qtMrCdcpRUfQ5Th4=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=MIME-Version:Content-Transfer-Encoding:Content-Type:Message-ID:Date:
 Subject:CC:To:From:Sender:Reply-To:Content-ID:Content-Description:Resent-Date
 :Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:
 References:List-Id:List-Help:List-Unsubscribe:List-Subscribe:List-Post:
 List-Owner:List-Archive; bh=czRpmkdLFj2dU8soGIByve4jBKOCypuLbdF86yim2eg=; b=C
 t9DtymcHoNiAOcSHb1y9Y0vDEO4bA/NPjsaKuFn2WOSPoEzlyrAJaGZyzXdwcty/V/TB790dm8jEg
 G7aTrXF9xGZrWXQzvyH13g7YEIDRLzyG1K0EOoS9kTe/JApLRuZv9w3ZlrfLJYVwRDATr1Q8C4nyN
 Si3j7BHIVlrWzHt8=;
Received: from mx0a-0064b401.pphosted.com ([205.220.166.238])
 by sfi-mx-1.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.94.2)
 id 1nniUC-005CIs-Ea
 for squashfs-devel@lists.sourceforge.net; Sun, 08 May 2022 15:06:20 +0000
Received: from pps.filterd (m0250809.ppops.net [127.0.0.1])
 by mx0a-0064b401.pphosted.com (8.17.1.5/8.17.1.5) with ESMTP id 248EkhCp009155;
 Sun, 8 May 2022 07:46:43 -0700
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=windriver.com;
 h=from : to : cc :
 subject : date : message-id : content-type : content-transfer-encoding :
 mime-version; s=PPS06212021;
 bh=czRpmkdLFj2dU8soGIByve4jBKOCypuLbdF86yim2eg=;
 b=VCPNod0eaXGSgWMVbXd8SeS/AwtSOXBzXuklPMb4NfL0oMFQb+FtwMt/M32LycBGSjxW
 KYa9oFesdmmyUSju3eDdDf4N0BWakvbrv1b9uFbKPXm/FSutnFyOYlOJJ2oWBUNZu5fM
 tcXvWcYoywbD+w+e4NpSP7CjOnfNo45krZ8ir/Ch6WCoKRPwgadEUsbeWGPl066JstOp
 dbdbZbClYhI2r8qfpnQMGZJ+FEig8jPUEMSv0+/BfTs9wPG8uyLSk0RvI2D1rW+CF4Fa
 yZQOHiTFbRAYZPGHyIUJaigPwfQgbe0iOP8+iD/bpgmwRSlRWp2ncdGLjinVxuKvzhiT Kg== 
Received: from nam11-dm6-obe.outbound.protection.outlook.com
 (mail-dm6nam11lp2173.outbound.protection.outlook.com [104.47.57.173])
 by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 3fwr9k0jmy-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Sun, 08 May 2022 07:46:43 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=EsZRZtcCCNxrC4HBtMwvuF1DslG5Hftaddh4/eC4kANzCHICMrna8zILBmgjpq6QbxCumXO3NvVu7f3gwjUKwr+HGSqlKEqSD7tyyPvx/IwXuB4CEVnbh/j8qMOT0nuQL5e8W4za9oRKiViUPhwjeX0RXRkZwKzqiL4EHIK5IxvBaTctGH/Q/VCLF2gAN7P95sBUd8R/9WfaGOytVirgLVcNh5fElPUmfqrfkpKjS4iBpRN8zCU0zEFSAz5lu0EW35nDVHF302ooYpweI2OdNOjIzWhVS2VIE6i1Aa/Ol7Y41CgD+efW5xscHneps91PVDCw3MPNAt9wmHpskiclhg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=czRpmkdLFj2dU8soGIByve4jBKOCypuLbdF86yim2eg=;
 b=EFRLLwTEHXbYPL/0NQCgmrGANN4NNdJGhbtwR5BE3NUFxfmAvt8gOfQo3UlSeDSucsKop4I2OODUB2ZfMrultgAJXbvzBEC7jceddlmOPoZQxrc6qDYM7pO5FfQCLB3jp/N7VQ8UCmBxGlCnA8qE4wRFqMh2RAzEeWBl89V/pRnjhhTHxq7K9mMKLXbE/Ol2vLg1iBic2ZUihqLVtVNwzZVt69HUILGJvUQpHOWBYb3qKUIKFMiOWdiyyUc5LLBq7B/uzs5OFRmF9EVwnHU1P5IJ9vFfc6AV8NL6rvNKByhC1KqrEMNysh9lttb+1+KXP+yHmZPVnnBoBMc6F8i0Xg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
Received: from PH0PR11MB5192.namprd11.prod.outlook.com (2603:10b6:510:3b::9)
 by BY5PR11MB4291.namprd11.prod.outlook.com (2603:10b6:a03:1c2::12) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5227.18; Sun, 8 May
 2022 14:46:41 +0000
Received: from PH0PR11MB5192.namprd11.prod.outlook.com
 ([fe80::1d6f:9e73:f47:3ba8]) by PH0PR11MB5192.namprd11.prod.outlook.com
 ([fe80::1d6f:9e73:f47:3ba8%7]) with mapi id 15.20.5227.023; Sun, 8 May 2022
 14:46:40 +0000
From: "Song, Xiongwei" <Xiongwei.Song@windriver.com>
To: "phillip@squashfs.org.uk" <phillip@squashfs.org.uk>, "willy@infradead.org"
 <willy@infradead.org>
Thread-Topic: squashfs performance regression and readahea
Thread-Index: Adhi6Hqd2L+DZdiJQaOdnMUF8OAN3A==
Date: Sun, 8 May 2022 14:46:40 +0000
Message-ID: <PH0PR11MB519282C2834C7BB7B5431F34ECC79@PH0PR11MB5192.namprd11.prod.outlook.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: bf8ce95a-aa1b-4f41-f920-08da31018ffe
x-ms-traffictypediagnostic: BY5PR11MB4291:EE_
x-microsoft-antispam-prvs: <BY5PR11MB429170C117D836712CCDB8CCECC79@BY5PR11MB4291.namprd11.prod.outlook.com>
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: EWTbQ4EqIDMbv99mzx8cUpGWCGHsiLTJQCpJJkjYPL8qq4izazxahoLuXgDKw/5P86/stufcrdOC10qTthR3U2VG401fYGW/sDsWDVyvJFB2F1f5tGH9lmpjPDfryQepIk02xsw5zwi9emvSYdplj9G2mKW4fDHHZjnycGaHQ8nfVnYjlt+fxF4oG5W5yJInXAUnV7lHg5Yfwtd8/0BgN5GFacl4jsS63zK9Pj6OJpVvxsT8m5vrFQWuE32ybFp4urvzkgpy+QNO+fjQlQ/Iy8QoVLPrBM4sQG5OCW2NNoRkWxPd7SujbQdOofPEbQAmietLu8mETLM4GG8FZpIiwMDHmTzGVZ8Gfkc98j3Q1eCSaz9QgbyoZdm17YpCrEmoHQC7Gi3xXlyPZVPS8fhVPrBFCwoh1NVedK/1qZmT2lk4cPebo513/qQz3aZPiUsSdl1KLCOdbNEAWiRCbw0ZR9Okf1kN3bsHxdSdi3/JzU9oBC2yUEt+BxDHmkJE4FrF85aVBTTqXJSwJfk7hBPbfK8SBecHLpHUf3LVsoGi4GAjXFxtK58gZG1ufipj9BSFDkut4y2aRP/7KkVFLwQ6gbJK8AU8F9j/XsPl6dmP6Qs3UdP7xhZroqUZh91WG0lcwZ2C/XpUeGlm8GoX76JQy/9h2LlPGS6IdMV+RZDj93zhie9fv0S+BhepP8ySF6XmYLUxK/2znS0e/vHzyFjcjdz4VaYIUD68WofFqR0eSuI0gjiV7Kj7wozcpAhhjLOV97N/H7Ahqx6xDdBib64zCwx0c9ZO/Z73wAoZHLIgi5o=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH0PR11MB5192.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230001)(4636009)(366004)(52536014)(508600001)(966005)(64756008)(8936002)(66946007)(76116006)(66476007)(66446008)(66556008)(5660300002)(9686003)(2906002)(38100700002)(38070700005)(86362001)(4326008)(110136005)(8676002)(7696005)(54906003)(55016003)(71200400001)(26005)(33656002)(122000001)(83380400001)(186003)(6506007)(316002);
 DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?us-ascii?Q?G90sm4dW01QwXtfS2GjKCccmAQ/SzPrF/U0PGunwMlVGISMeNCDpW4/A48Sc?=
 =?us-ascii?Q?RsW+euhUCiwfs/xBsCgGa5nqDSY2piP1CbtKphM7Jgi5OlWtwVkfx/wgZ+gJ?=
 =?us-ascii?Q?hrulD6VmIg0iPr9R7OQRM+4LCWXdNT/gBR0eT/0VhxTwjd9N3Y6XRFQwdgKJ?=
 =?us-ascii?Q?Lg1fx776N8xBynklrMByFS+3HR/IfA3o5y+PfyJvcixSLKkbMlG6k5/8RKUM?=
 =?us-ascii?Q?BY3hIg4c7DCemGk5yRHZSqlahADClxR6b96ceDNVX7Hv/3csJt4I6CgQt6gl?=
 =?us-ascii?Q?hOCAB5Uc2n3pxdLphBdTL9E0q5z6QH8iAUx22cRbeV4S3WIE1eF9Mb/Zvor1?=
 =?us-ascii?Q?t/Ud4/93wiMeVadNYyrhWvIgGKFbSWZNy3ficonJSYWiSHgSIF3phJ/NK9Sj?=
 =?us-ascii?Q?Zkbw7fDGorExJ0K9ICPpL72t33Zoi40C0PEl//yv4zUw37lw0hug4Iwa68qT?=
 =?us-ascii?Q?nMUXoltZW6+iUHmhyDBvDYQYQ3k1xrogXPdMZMWjTZAwMnXwfO+kLvtqYM08?=
 =?us-ascii?Q?zJ/42kzFWo66JJNsD0y9D3vyFvvPjWrGrBAOOQFwHG/YKoENZwiPLRUul9WX?=
 =?us-ascii?Q?x6kqbwY3ZO3A5Eb/+SV1cRAnT2LmQVUBUQIRbD67wSLLOGb3Qbw4hzEwu+H9?=
 =?us-ascii?Q?XWREt+Hckb5/MOvi1nFBWvxSrd1qY+QiSiURPFRoqHU8p7EdiLaa91DuOkQt?=
 =?us-ascii?Q?TlfL2/Zhiqo0M15JJW146cdD/gwPygmDqexCHMXoXeFEsYI3zLCKwIC6+B21?=
 =?us-ascii?Q?sCkBnMN5vhPVdgy4MmukAi4NaBV8BNOiskns+U/6Xr5HaE6Lawxv+FpHQJap?=
 =?us-ascii?Q?L4nN6VoE2SAGZv71cjsKJqQNyJwyJ5dNbb91ozmoh8hHo2N16Rb9SFOoRXTQ?=
 =?us-ascii?Q?hN45iyPsu5VDj0dtGOLkNiLkq0Bc0OiKyoXr3yLdI8huGLBUrEA11QlcGs6t?=
 =?us-ascii?Q?hDLfEPx9XNeqI2SZ/RDcU/ihzqYeOhLSwIYY3pZxY75o1JmJRoxSuiFUrci2?=
 =?us-ascii?Q?Cu1M6krdSiL4f+2olrvrSb+TGIcI1cvG8wY+KAFKC1X/ks33Q50s5TSf47ew?=
 =?us-ascii?Q?AM1zzNNdXI04sAG5kDTPGe32pANPCP+v5UbSmTtSQ7JD6aQwGfbjKRttk1hN?=
 =?us-ascii?Q?0tei7xe/PwaO4jZwgFwVBLRNNXDaCpD8n8M3KPQPjA/ha54LNXbupWiR4aqG?=
 =?us-ascii?Q?exgcqBZY5K9npxSYZQDVOEBQYWPdj8fBJjr0/KuNtmsQkKZEi/p0JDjPfCxh?=
 =?us-ascii?Q?/NqbTZL8KraQvut5oN+oQKJjtiz0odaHxw+zCDyqVD6Jqwi9Y/axboOAV5CI?=
 =?us-ascii?Q?KPwicasqVSsmeMVt7w1b0JF7IN29pTfn0+7p1UP8TeuGuslTCbzGQ9rnKv/O?=
 =?us-ascii?Q?Rcqb23IZma7O1NeGcs5VzfbB3B2xrXFQYl8PcJvu2nAXUUDXwYbDDIGxtieJ?=
 =?us-ascii?Q?H4BToYoOU80gMoma6xrM5uBDoBVXmXzZ+f/MekLLUW2fVW6azrRPY/NrCe0c?=
 =?us-ascii?Q?6Ttg5YvAErsh90IjAWKliDVtU6wGH4dhsGuCnl88qASeXQMeL2lde8BgTMYv?=
 =?us-ascii?Q?gtEySwjwD88tihvPN+bQtS5Rgn2lUY3Tioz9kXSt6HBt/WZ3ZfKnp4xhPXSH?=
 =?us-ascii?Q?akIU6pTehjMhU6mSZL26FCrKGtdmOrAIQvK2mt511NVGzulbA1qJIKJwf4KX?=
 =?us-ascii?Q?rZcIqCpgELqYGWdOSeNgULx4umkgJs3NkJpbgD0DUeFABUDPE3t32a7Juxn/?=
 =?us-ascii?Q?bXxF2Sno3n39F2UAtpvJeMVcLEyYDR4=3D?=
MIME-Version: 1.0
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: PH0PR11MB5192.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: bf8ce95a-aa1b-4f41-f920-08da31018ffe
X-MS-Exchange-CrossTenant-originalarrivaltime: 08 May 2022 14:46:40.6457 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: IuYtV7PKNuH90Wb7kBSOWHswFAkFHJTizGqg0H7lBX+o4dzyhUsszK9fsTClp+rBpKbBfNzT8+BslXFTiAuJhKpkTtKvp3gYhypQ3clkmv0=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BY5PR11MB4291
X-Proofpoint-GUID: mr9l80J1OKJq0iLeJCqILjcSYnNWqkmW
X-Proofpoint-ORIG-GUID: mr9l80J1OKJq0iLeJCqILjcSYnNWqkmW
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.858,Hydra:6.0.486,FMLib:17.11.64.514
 definitions=2022-05-08_04,2022-05-06_01,2022-02-23_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0
 priorityscore=1501 impostorscore=0 spamscore=0 mlxlogscore=389
 phishscore=0 malwarescore=0 suspectscore=0 clxscore=1011 mlxscore=0
 lowpriorityscore=0 bulkscore=0 classifier=spam adjust=0 reason=mlx
 scancount=1 engine=8.12.0-2202240000 definitions=main-2205080098
X-Spam-Score: -0.9 (/)
X-Spam-Report: Spam detection software,
 running on the system "util-spamd-1.v13.lw.sourceforge.com", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview:  Hello,
 I am facing a performance regression on squashfs. There
 are many squashfs partitions on our board. I am doing the operations below
 on 90 squashfs partitions: "for cnt in $(seq 0 9);
 do echo 3 > /proc/sys/vm/drop_caches; 
 echo "Loop ${cnt}:"; time -v find /squashfs/part[0-9][0-9] | xargs -P 24
 -i cat {} > /dev/null 2>/dev/null; echo ""; done" 
 Content analysis details:   (-0.9 points, 6.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 -0.7 RCVD_IN_DNSWL_LOW      RBL: Sender listed at https://www.dnswl.org/,
 low trust [205.220.166.238 listed in list.dnswl.org]
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 -0.0 SPF_PASS               SPF: sender matches SPF record
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
 envelope-from domain
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature, not necessarily
 valid
 -0.1 DKIM_VALID_AU          Message has a valid DKIM or DK signature from
 author's domain
X-Headers-End: 1nniUC-005CIs-Ea
X-Mailman-Approved-At: Tue, 10 May 2022 02:10:09 +0000
Subject: [Squashfs-devel] squashfs performance regression and readahea
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
Cc: "linux-mm@kvack.org" <linux-mm@kvack.org>,
 "squashfs-devel@lists.sourceforge.net"
 <squashfs-devel@lists.sourceforge.net>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: squashfs-devel-bounces@lists.sourceforge.net

Hello,

I am facing a performance regression on squashfs.  There are many squashfs 
partitions on our board. I am doing the operations below on 90 squashfs
partitions:

"for cnt in $(seq 0 9); do echo 3 > /proc/sys/vm/drop_caches; echo "Loop ${cnt}:"; time -v find /squashfs/part[0-9][0-9] | xargs -P 24 -i cat {} > /dev/null 2>/dev/null; echo ""; done"

On linux 4.18, I got the elapsed time statistics below with command above(run 
find/xargs/cat commands 10 times):
1:22.80 (1m + 22.80s)
0:59.76
1:01.43
1:02.48
1:03.03
1:02.92
1:03.19
1:03.22
1:03.26
1:03.14

On linux 5.10, huge performance regression:
5:48.69 (5m + 48.69s)
5:52.99
6:06.30
6:01.43
5:50.08
6:26.59
6:09.98
6:04.72
6:05.21
6:21.49

By "git bisect", I found this regression is related to readahead.  After reverting 
c1f6925e1091 ("mm: put readahead pages in cache earlier")  and
8151b4c8bee4 ("mm: add readahead address space operation") on linux 5.10,
the performance is improved:
1:37.16 (1m + 37.16s)
1:04.18
1:05.28
1:06.07
1:06.31
1:06.58
1:06.80
1:06.79
1:06.95
1:06.61

Also, I found disabling readahead is helpful with 9eec1d897139 ("squashfs: provide 
backing_dev_info in order to disable read-ahead"):
1:06.18 (1m + 6.18s)
1:05.65
1:06.34
1:06.88
1:06.52
1:06.78
1:06.61
1:06.99
1:06.60
1:06.79

I have also tired with the upstream linux 5.18, see the results below:
1:12.82 (1m + 12.82s)
1:07.68
1:08.94
1:09.65
1:09.87
1:10.32
1:10.47
1:10.34
1:10.24
1:10.34
 
As we can see that even if the readahead disabled, there is still extra 2 ~ 3s overhead
than linux 4.18. BTW, the reverted two commits above are from " Change readahead API "
series, see the following link:
https://lore.kernel.org/all/20200414150233.24495-11-willy@infradead.org/T/#m22d6de881c24057b776758ae8e7f5d54e2db8026
.

I would appreciate your comments and inputs.

Regards,
Xiognwei


_______________________________________________
Squashfs-devel mailing list
Squashfs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/squashfs-devel
