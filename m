Return-Path: <squashfs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+squashfs-devel@lfdr.de
Delivered-To: lists+squashfs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id C595A520B05
	for <lists+squashfs-devel@lfdr.de>; Tue, 10 May 2022 04:10:17 +0200 (CEST)
Received: from [127.0.0.1] (helo=sfs-ml-1.v29.lw.sourceforge.com)
	by sfs-ml-1.v29.lw.sourceforge.com with esmtp (Exim 4.94.2)
	(envelope-from <squashfs-devel-bounces@lists.sourceforge.net>)
	id 1noFKD-0003zL-CU; Tue, 10 May 2022 02:10:09 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-2.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.94.2)
 (envelope-from <prvs=2128951b04=xiongwei.song@windriver.com>)
 id 1nnzvG-00023x-P6
 for squashfs-devel@lists.sourceforge.net; Mon, 09 May 2022 09:43:21 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=MIME-Version:Content-Transfer-Encoding:Content-Type
 :In-Reply-To:References:Message-ID:Date:Subject:CC:To:From:Sender:Reply-To:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=bsllY+ATra5VV3a3Ld0ekYfrokO/1n7gKStcbWRxKhY=; b=HZd3aEz7M/095DPkpqiXQ7K+4S
 W5WctP80tTrha7hhQwjXxUYGlehSmKiVp2ZzAT/mZXweWzO2NS8nVoEJxBGuBQROsX0bJTk5G5S2E
 8A2K0vVUtdMpKfYHIvcJE5QHDAfuDTnKjUg+GSeD7KkJu2v+JqqyxYWc1v/8dy9UnaS8=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=MIME-Version:Content-Transfer-Encoding:Content-Type:In-Reply-To:
 References:Message-ID:Date:Subject:CC:To:From:Sender:Reply-To:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=bsllY+ATra5VV3a3Ld0ekYfrokO/1n7gKStcbWRxKhY=; b=blrlhApUyMLFuZqvfKfQFxpQQI
 wZsmP5niaZBRulm5HQQQxbdH5DVIy7vAAIpS4wy8xFP1KeMCW04z59sdlg5+oNJj/E2uqs9twkIDY
 HGljCiaoiK9xF2UzWh5eP29qmL8FnIG452yCR2yExps4rHXeHP1IoKdgqw8BErGYUtYw=;
Received: from mx0a-0064b401.pphosted.com ([205.220.166.238])
 by sfi-mx-1.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.94.2)
 id 1nnzvB-0063iW-Uj
 for squashfs-devel@lists.sourceforge.net; Mon, 09 May 2022 09:43:21 +0000
Received: from pps.filterd (m0250810.ppops.net [127.0.0.1])
 by mx0a-0064b401.pphosted.com (8.17.1.5/8.17.1.5) with ESMTP id 2499Ihid030421;
 Mon, 9 May 2022 02:42:54 -0700
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=windriver.com;
 h=from : to : cc :
 subject : date : message-id : references : in-reply-to : content-type :
 content-transfer-encoding : mime-version; s=PPS06212021;
 bh=bsllY+ATra5VV3a3Ld0ekYfrokO/1n7gKStcbWRxKhY=;
 b=K03v/hgpnV54GqpXu07b1kyS200pjFngkaSv3aUxOFud79Uc9d99kizE49XU0uhaGpH7
 PhGdZwArjpRQ/RQ8XCmUdwqbwEFDIFaHMsRxNHC7+tWQ8B89HzV6VJ1UmMfGVINe3csS
 9CfLXzO6iJZVo89Lz8bomMWS+mHmSzsLkPztTodNwQByNXNqoks5QohyRl4Wd1bqaC9m
 b7P2JgtbbbUnwXo5qV1dEpgr8r7S3lqohTMat9IWNmjodVdzty0uYvxG/RjUOEPPs+8c
 m8jlpm/Wd7HE3s0qn7kB1mxulHeUaKi3jOrcaaEhixMnkWqrUQj+hPW8mPdrCCz6DKgw zg== 
Received: from nam12-mw2-obe.outbound.protection.outlook.com
 (mail-mw2nam12lp2045.outbound.protection.outlook.com [104.47.66.45])
 by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 3fxde5ggm3-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Mon, 09 May 2022 02:42:54 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=QiGfdvJ7o8nrb4DVju6STrO4uaI1wYaAx0wj0u8Bq7yMapn2WqcGxBm+Uy618NokwI4Oszl5PRoHq6VeZv5iMTsVcJFO2wtQ038ZBTy9R9MIQb2iDtPVXs7lMXAS6JQiCWuWK+6Cl0AGPdKV48yC7SuhZhJw4q+pXvfvwrqnEQM6IaCEHhqDqIX6Bsq/SGsWvfZrfcMcreKNn1Nggsv4v/Tyb+kVg+xpi0zlmbMa4p8vOWetjbRk4nGMHLrOuwl5Cqd2OJ6XKHkp4J5PIiWBXoFay0RU57icUUr/cjZMSg6g2E7b4E2suRlrL48QHQ18cVmqdf1Photgan7qHb4Yog==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=bsllY+ATra5VV3a3Ld0ekYfrokO/1n7gKStcbWRxKhY=;
 b=kLIuJxxKt3o8WjDUJqRaBOvdL8u1C+k7cxE6+Nc7qWxQL0qYPSTMynuaEHZ9A2DXwNfJ1foapYWSojRzzD5jINPpiO4DmQTjSJ8HpPw7LDugAnthR5BVfhqd+ouC6csxNNKBAX/NG4IxFsNKYriKdR0iHvDcKlEbSS7knIRws5m178KDAT72L7gOtzeibeM6pq04Z2SrLIO+w9l0sDjoZinrS1GdMdKSFRqpNM73/GiFDiHRcB6irCtMaze7P3+GSVmKsAs3whkA2TwWlOxuYstG1hZD5ODm3Lb7S4TepoTzc1xeylGgxtRQzF6Ny7nTd/DDl6Jv8NlmG00sH7dokw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
Received: from PH0PR11MB5192.namprd11.prod.outlook.com (2603:10b6:510:3b::9)
 by CY4PR1101MB2198.namprd11.prod.outlook.com (2603:10b6:910:1d::21) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5227.23; Mon, 9 May
 2022 09:42:51 +0000
Received: from PH0PR11MB5192.namprd11.prod.outlook.com
 ([fe80::1d6f:9e73:f47:3ba8]) by PH0PR11MB5192.namprd11.prod.outlook.com
 ([fe80::1d6f:9e73:f47:3ba8%7]) with mapi id 15.20.5227.023; Mon, 9 May 2022
 09:42:51 +0000
From: "Song, Xiongwei" <Xiongwei.Song@windriver.com>
To: Hsin-Yi Wang <hsinyi@chromium.org>, Matthew Wilcox <willy@infradead.org>
Thread-Topic: squashfs performance regression and readahea
Thread-Index: Adhi6Hqd2L+DZdiJQaOdnMUF8OAN3AAEnd2AAB4SFgAAACwcAAAFQokA
Date: Mon, 9 May 2022 09:42:51 +0000
Message-ID: <PH0PR11MB5192681FB568B2D1A06F41F1ECC69@PH0PR11MB5192.namprd11.prod.outlook.com>
References: <PH0PR11MB519282C2834C7BB7B5431F34ECC79@PH0PR11MB5192.namprd11.prod.outlook.com>
 <Ynfzh2ifG85MZEoN@casper.infradead.org>
 <CAJMQK-jNYoJVqsri4REV=E3bG8AS7T82HrVSAUPzbUiWask01A@mail.gmail.com>
 <CAJMQK-i3OQxcG7=LzTG4k70BP0j6PstWw0C45xcEi6iVLn_2ag@mail.gmail.com>
In-Reply-To: <CAJMQK-i3OQxcG7=LzTG4k70BP0j6PstWw0C45xcEi6iVLn_2ag@mail.gmail.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 1683fd41-a4e0-4111-4922-08da31a04906
x-ms-traffictypediagnostic: CY4PR1101MB2198:EE_
x-microsoft-antispam-prvs: <CY4PR1101MB2198F8919204674C0260AF1AECC69@CY4PR1101MB2198.namprd11.prod.outlook.com>
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: 5fJdMH3jq0U5FNWGTS7YfckAa3Fnzy+u1Yh6c2WmEAt4jUVAksYmDPHn99obUErQc1FalySpFVUO+u/2eGPEsHbm1PLZElQKSTdR4wPFm7KD3CgQmhVTT2uXogcrAh6wmYyfyQZA5FZVRmrv6+QX8M7XNTVgvqLIIQ5VHpkCxxDA6NarYTWgLXHMGBuHNcntSBHoAryFtXjsE6VYQfhOKtD1xe/2wZuWWieIG7+PRhWEtAcD2IPbp1Iup73PSNXUa7MUEeV/ourJD5DQnDVjgve8Jgm9ebyk3JgOuKCnS3GpGj2zcFDAjxgIpjhLDlT9MtVzbqGh3uHBJWJlw5g54hmZUxBOhQI2tBX1hx62DY7UmYCsakgYUP+f8zzga+XbGTaLHroUskaAOnHfnHUMLGmW6OtkuckXL84vU4n1n2iMJ6wUsnERdRz6Mz8LC/RDBz0Dba7aLKQtw1Q1k74Ows8LqNMVEVy60PHiv64P49AGvTGYWiJXuQI8QorAfEYdgGRCyCuwA6uXojw3v1SMX0eAJSJEP7yd46+cXNqwN2XvmdwQi84oC8ogHBFnRCERQrhM7ytvTob+CxI7FU7LPcH1kEGR0N4z95Ay8qBI2FGvQVxUz+8qV86Faq3vKTqSpAkD6nAB/KxVLog/WHtJNanP8pxCjYQnI4hUtHbsuYa3doad9WS6YgeMc3CQs7W8E4fTBOEKR8B/TczWppUQ4g==
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH0PR11MB5192.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230001)(4636009)(366004)(33656002)(83380400001)(186003)(7696005)(26005)(2906002)(55016003)(110136005)(86362001)(38070700005)(508600001)(9686003)(5660300002)(38100700002)(8936002)(71200400001)(54906003)(66476007)(64756008)(66556008)(66446008)(76116006)(66946007)(8676002)(52536014)(4326008)(6506007)(53546011)(316002)(122000001);
 DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?Q0FlYkF2UmNaL2s0RGt2ajhZaWRKRlBlNGNTRGJZNVlBakU3ZnZOUlRmRzZ4?=
 =?utf-8?B?U29wMmxiT1l0RVMrUnBXVFhydGdXck5LQmFPZXBVN0cvdVFjckZUWkJnS1Ra?=
 =?utf-8?B?bUd4VWtVd0pmWERXWkxRUHFuM0tZR3VGSDRmT2FrVko4Q1htQmhsTHlXNUIx?=
 =?utf-8?B?czBkYStEdHV0ZEFxTlJaR2Y3VDVFSmxHbFQ0Nlp2YUR4Y2hpZnVydThjd2xV?=
 =?utf-8?B?ekZjUzdhVTcwNVQzWU5ZQjNFWGVSNmFsMERmV3ZPdkwweFhIZFRHek5Ya0Vr?=
 =?utf-8?B?dnNiTkhReFhSZUUzMmJOZUpmd3FoeW81QkNDU2toQnVKQ056T1FBaG1qQVhD?=
 =?utf-8?B?THF4OGF0RzFnVHEyQktEckVnK3J3RHZYUXNuelRxS29BalMzLzVVN3Bsc0hF?=
 =?utf-8?B?MTllZ2xoVExpQUJyU2pDRTkxRXNYWXQwcXFGRzFQeUJDTFF6elllTkczMFF2?=
 =?utf-8?B?N3pLemFoZmdHK1pqSDJVQVZxTHJrbWE3ZUQ4bHlrNjAwUFdSN01oNkVCUTlY?=
 =?utf-8?B?d0FxbXFoNldRSCtZVlArMXoxaTVnOGc4ejE2TkhxdjRMQTFnZzQvNlA0VEVv?=
 =?utf-8?B?Y01tbHhrT09jenpYdmd1b0t0N1dCQ1BOWG51MjhXdDd0VG82blhuczg2SnR3?=
 =?utf-8?B?YVI4SXo3dDJmbWNQRDFvb3o5dVNBSjZhTzFxenk3ZFpNaHpBUWdkODBKeDFT?=
 =?utf-8?B?ZHhOODhHbCtjdjBQL2NLVEYvWmVOcktydWpneC8wS291VHVKNHVpa1RHd2h0?=
 =?utf-8?B?ak1JOFJPdTdoRjdMeFE3QVJkWitVb1YxVEliZ2ovb01rV3BCNUc4cCsxdXh6?=
 =?utf-8?B?ck42aGx6dnNDVTRjZjJKeUcwUndLY0E4c29uenlRUkxaU1lkbnAzb2YzU0I3?=
 =?utf-8?B?czdOWEZLWEZnVm9TZXlnOW1QMU11Qm8zcDE1ZDhKK2I3bjEvRmtjazZ1cVlY?=
 =?utf-8?B?WGxSTHczclF5ckxNOWlBK25CRDNtVjFNenhDSTAwdUVnbndQTFFoS3pHZDZv?=
 =?utf-8?B?eTdQb0lnUkc2Y3htRkU4TnVnK1h0d2dyemlnbzgrWk9PeXJlamNqRGcrRnA5?=
 =?utf-8?B?UThHZlhld21GdjZ0R2NUcFRqaGh3cnRibS9PY3UvcTJSOU16RFZEdmVOVGFB?=
 =?utf-8?B?N2dDRm54b3FIWncrbitwRlgyR1ZndU5jSWJGanNvTG1oUFFkbVQxcW1HeGNT?=
 =?utf-8?B?dnUwZmlwMnVlcjNmVWR6RitZa2hsMDZVbk1wb0pmanV1bStYb1hsR0dZM2Rp?=
 =?utf-8?B?K2loenVHbG90bGdhR1EwaSs5ZDR6YitSS0xDTjFBNFF5bTFYdjdyRXlXRXB0?=
 =?utf-8?B?am0xM0xTMm04VkFiTzRmSkVabHlPZzZOM2FlbGI5cVYwa2NiYllvRUVoRVNL?=
 =?utf-8?B?NTc5RityUGIrQzVFU2FFQnVZaFNWUFVNYW1NaGpwNmc2TXkzeGM3aWFCUnNZ?=
 =?utf-8?B?Z2VCRmI4MnBBT2hmSG9oZ0hJdDZEeDNFbHZ4clo3aHREeHdhWkRNS0lDU1FI?=
 =?utf-8?B?RmNoeVVkZzZ3bjlpNE51a1l0UTNsdGkzanFTSDdFTnBlNWkzemxzdENuN01j?=
 =?utf-8?B?WFMrc2RXOExUYnNHelVFcVBuTXhHazBpMW81MjV1T01NRmNSOXhyNDBUaUZm?=
 =?utf-8?B?QXNZTVNHKy9HSDd2bjA5QnZzdm1BbUxNendMcG1VcU5UV0NiTWwrVHByeGhh?=
 =?utf-8?B?dU5mNWRadTJGMFBEMXFaVktxejZmdjlXZVQ2MHY4ek1JVjhIWHRSVGVBc1N0?=
 =?utf-8?B?c0VyZHRvajBJMUxRUURzS3dUZno5QndOSWliNFg3NWEzeVE5b2h6cHh0VHlu?=
 =?utf-8?B?RGw3byt3MFgyVVdMM3NuR0hIWDJPS0hFT3NPZ2dGeExZeFFvT0dSUHZKSHZ6?=
 =?utf-8?B?YmZEQ2lVVjNhbVNxWTI0VW1pL0xRRlUvQkJzcDdibTExUUlVSUNpSkpHa01W?=
 =?utf-8?B?YVdJM0RqRnlFanllR3ZPUE9XWFE1QVZLMFhBc1Y1NXRjK2ljZHMrRlpqTnJw?=
 =?utf-8?B?eENNeGpLbG9hREh3NjdVSGk0Z0tmNlUzSFcraVNzQjlPK3UzVUI1djBFOVdP?=
 =?utf-8?B?M0drUnd1VGZESDBFbDI1VHNmQzRBanRBLzBhbkhtZjUzS0NZZ1ZDVFIxZnJz?=
 =?utf-8?B?Q2xIQzNJbnhmNGRJM1N4R08zdGtkV2l4QWpYOW1taHdQbHFiM1IwaGEzR3Fz?=
 =?utf-8?B?cEwxUldXVXdRb0NzU2YrTG5LbkVhaDRGSnhhSWxYTzY2L2tVUnlnekZodGhF?=
 =?utf-8?B?YVlhM0hjejk3a2RXQVZkUTA0ekpJaS9odUJ3VFUvMnBwRnVFR05tUFFVVUk1?=
 =?utf-8?B?MVBlakVRN0NjUHJZNTcyWm5DSzE2QTBNRlljMEloeDFhUUpRbWZwemlvUEt6?=
 =?utf-8?Q?LKbUgJVSWa2WrVco=3D?=
MIME-Version: 1.0
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: PH0PR11MB5192.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 1683fd41-a4e0-4111-4922-08da31a04906
X-MS-Exchange-CrossTenant-originalarrivaltime: 09 May 2022 09:42:51.5554 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: MILVy5XGmhLsW6BhmaVCzxncnyBCaTcZhJO8YpgzCPu6BadXkvx7+EFJxDcTyjnvFQNVnGE1qNNGna85ygI9jZFRNO0Y+s4jmMI3e9d/lYY=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CY4PR1101MB2198
X-Proofpoint-GUID: vOMLQD5P21yB6KwNMVHD9zzQuelVz8K4
X-Proofpoint-ORIG-GUID: vOMLQD5P21yB6KwNMVHD9zzQuelVz8K4
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.858,Hydra:6.0.486,FMLib:17.11.64.514
 definitions=2022-05-09_03,2022-05-09_01,2022-02-23_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501
 phishscore=0 mlxscore=0 malwarescore=0 clxscore=1011 bulkscore=0
 mlxlogscore=999 suspectscore=0 adultscore=0 impostorscore=0 spamscore=0
 lowpriorityscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2202240000 definitions=main-2205090055
X-Spam-Score: -0.9 (/)
X-Spam-Report: Spam detection software,
 running on the system "util-spamd-2.v13.lw.sourceforge.com", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview:  Thanks Matthew and Hsin-Yi. I will test the patch by EOD.
 Regards, Xiongwei 
 Content analysis details:   (-0.9 points, 6.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 -0.7 RCVD_IN_DNSWL_LOW      RBL: Sender listed at https://www.dnswl.org/,
 low trust [205.220.166.238 listed in list.dnswl.org]
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 -0.0 SPF_PASS               SPF: sender matches SPF record
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature, not necessarily
 valid
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
 envelope-from domain
 -0.1 DKIM_VALID_AU          Message has a valid DKIM or DK signature from
 author's domain
 -0.0 T_SCC_BODY_TEXT_LINE   No description available.
X-Headers-End: 1nnzvB-0063iW-Uj
X-Mailman-Approved-At: Tue, 10 May 2022 02:10:09 +0000
Subject: Re: [Squashfs-devel] squashfs performance regression and readahea
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
Cc: "squashfs-devel@lists.sourceforge.net"
 <squashfs-devel@lists.sourceforge.net>,
 "linux-mm@kvack.org" <linux-mm@kvack.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: squashfs-devel-bounces@lists.sourceforge.net

Thanks Matthew and Hsin-Yi.  I will test the patch by EOD.

Regards,
Xiongwei

-----Original Message-----
From: Hsin-Yi Wang <hsinyi@chromium.org> 
Sent: Monday, May 9, 2022 3:11 PM
To: Matthew Wilcox <willy@infradead.org>
Cc: Song, Xiongwei <Xiongwei.Song@windriver.com>; phillip@squashfs.org.uk; linux-mm@kvack.org; squashfs-devel@lists.sourceforge.net
Subject: Re: squashfs performance regression and readahea

[Please note: This e-mail is from an EXTERNAL e-mail address]

On Mon, May 9, 2022 at 3:05 PM Hsin-Yi Wang <hsinyi@chromium.org> wrote:
>
> On Mon, May 9, 2022 at 12:45 AM Matthew Wilcox <willy@infradead.org> wrote:
> >
> > On Sun, May 08, 2022 at 02:46:40PM +0000, Song, Xiongwei wrote:
> > > I am facing a performance regression on squashfs.  There are many 
> > > squashfs partitions on our board. I am doing the operations below 
> > > on 90 squashfs
> > > partitions:
> >
> > Hi Xiongwei.  Thanks for the report.  Hsin-Ye and I have been 
> > working on this problem off-list.  Hsin-Ye, could you send the latest version?
>
> Hi Matthew,
>
> This is the patch of the latest version. Since it's just being 
> reviewed halfway done, I posted the patch here, or should I send it to 
> the list directly?
>
The indent seems broken when I pasted it here. Resend in the attachment.

> Thanks
>
> From 03558dcaab93ed3c32498eb70c7f2b1382b218d6 Mon Sep 17 00:00:00 2001
> From: Hsin-Yi Wang <hsinyi@chromium.org>
> Date: Sun, 10 Oct 2021 21:22:25 +0800
> Subject: [PATCH] squashfs: implement readahead
>
> Implement readahead callback for squashfs. It will read datablocks 
> which cover pages in readahead request. For a few cases it will not 
> mark page as uptodate, including:
> - file end is 0.
> - current batch of pages isn't in the same datablock or not enough in a
>   datablock.
> Otherwise pages will be marked as uptodate. The unhandled pages will 
> be updated by readpage later.
>
> Signed-off-by: Hsin-Yi Wang <hsinyi@chromium.org>
> ---
>  fs/squashfs/file.c | 72 
> +++++++++++++++++++++++++++++++++++++++++++++-
>  1 file changed, 71 insertions(+), 1 deletion(-)
>
> diff --git a/fs/squashfs/file.c b/fs/squashfs/file.c index 
> 89d492916dea..20ec48cf97c5 100644
> --- a/fs/squashfs/file.c
> +++ b/fs/squashfs/file.c
> @@ -39,6 +39,7 @@
>  #include "squashfs_fs_sb.h"
>  #include "squashfs_fs_i.h"
>  #include "squashfs.h"
> +#include "page_actor.h"
>
>  /*
>   * Locate cache slot in range [offset, index] for specified inode.  
> If @@ -494,7 +495,76 @@ static int squashfs_readpage(struct file 
> *file, struct page *page)
>   return 0;
>  }
>
> +static void squashfs_readahead(struct readahead_control *ractl) {  
> +struct inode *inode = ractl->mapping->host;  struct squashfs_sb_info 
> +*msblk = inode->i_sb->s_fs_info;  size_t mask = (1UL << 
> +msblk->block_log) - 1;  size_t shift = msblk->block_log - PAGE_SHIFT;  
> +loff_t req_end = readahead_pos(ractl) + readahead_length(ractl);  
> +loff_t start = readahead_pos(ractl) &~ mask;  size_t len = 
> +readahead_length(ractl) + readahead_pos(ractl) - start;  struct 
> +squashfs_page_actor *actor;  unsigned int nr_pages = 0;  struct page 
> +**pages;
> + u64 block = 0;
> + int bsize, res, i, index;
> + int file_end = i_size_read(inode) >> msblk->block_log;  int 
> +max_pages = 1UL << shift;
> +
> + readahead_expand(ractl, start, (len | mask) + 1);
> +
> + if (readahead_pos(ractl) + readahead_length(ractl) < req_end) 
> + return;
> +
> + nr_pages = readahead_count(ractl);
> + pages = kmalloc_array(nr_pages, sizeof(void *), GFP_KERNEL); if 
> + (!pages) return;
> +
> + actor = squashfs_page_actor_init_special(pages, nr_pages, 0); if 
> + (!actor) goto out;
> +
> + for (;;) {
> + nr_pages = __readahead_batch(ractl, pages, max_pages); if 
> + (!nr_pages) break;
> +
> + if (readahead_pos(ractl) >= i_size_read(inode) ||
> +     file_end == 0 || nr_pages < max_pages) goto skip_pages;
> +
> + index = pages[0]->index >> shift;
> + bsize = read_blocklist(inode, index, &block); res = 
> + squashfs_read_data(inode->i_sb, block, bsize, NULL, actor);
> +
> + if (res >=0 && (pages[nr_pages - 1]->index >> shift) == index) for 
> + (i = 0; i < nr_pages; i++) SetPageUptodate(pages[i]);
> +
> + for (i = 0; i < nr_pages; i++) {
> + unlock_page(pages[i]);
> + put_page(pages[i]);
> + }
> + }
> +
> + kfree(actor);
> + return;
> +
> +skip_pages:
> + for (i = 0; i < nr_pages; i++) {
> + unlock_page(pages[i]);
> + put_page(pages[i]);
> + }
> +
> + kfree(actor);
> +out:
> + kfree(pages);
> +}
>
>  const struct address_space_operations squashfs_aops = {
> - .readpage = squashfs_readpage
> + .readpage = squashfs_readpage,
> + .readahead = squashfs_readahead
>  };
> --
> 2.31.0

_______________________________________________
Squashfs-devel mailing list
Squashfs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/squashfs-devel
