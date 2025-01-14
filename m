Return-Path: <squashfs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+squashfs-devel@lfdr.de
Delivered-To: lists+squashfs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 20C5DA11316
	for <lists+squashfs-devel@lfdr.de>; Tue, 14 Jan 2025 22:32:42 +0100 (CET)
Received: from [127.0.0.1] (helo=sfs-ml-4.v29.lw.sourceforge.com)
	by sfs-ml-4.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <squashfs-devel-bounces@lists.sourceforge.net>)
	id 1tXoWW-0004to-AR;
	Tue, 14 Jan 2025 21:32:32 +0000
Received: from [172.30.29.66] (helo=mx.sourceforge.net)
 by sfs-ml-4.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <phillip@squashfs.org.uk>) id 1tXoWU-0004ti-K4
 for squashfs-devel@lists.sourceforge.net;
 Tue, 14 Jan 2025 21:32:30 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Transfer-Encoding:Content-Type:In-Reply-To:
 From:References:Cc:To:Subject:MIME-Version:Date:Message-ID:Sender:Reply-To:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=gIYI5qGmkA7ZsCkkRj+KzC7EPFHo4ykuscFtGTFw44Q=; b=UFTgOt5cqfhwWt7N7hYMw1A4BC
 6mj68OhXJLqPMIbJlR11l65x2RCoiycUgU0Lv5HiovIuaEF1aftewIZMjQwWpqHzZ6zUNwTVec5Kc
 3D1d5L9dyCSBlIQhzD4o7Lu8b1Bpy4mM9oD78fGzZz5/AC4KIlyHcKVcxtz7IltxHfks=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Transfer-Encoding:Content-Type:In-Reply-To:From:References:Cc:To:
 Subject:MIME-Version:Date:Message-ID:Sender:Reply-To:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=gIYI5qGmkA7ZsCkkRj+KzC7EPFHo4ykuscFtGTFw44Q=; b=aJ1OIVB6y8got17295W7XJ9bvn
 4Yq8MysanLdJZu7xxdb7uhh0BN3aOcA9DGPlFWJlpngrJCyFdboMH4ryxhsTn4yRoy/O8qkXwp7+M
 YNIAVPoyPGPGuILA2ySL5BHl2B7wLQMnXBdMp0KQqfmwjXOGfX8tsR3dBON+tLegrGdY=;
Received: from sxb1plsmtpa01-02.prod.sxb1.secureserver.net ([188.121.53.21])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.95)
 id 1tXoWT-0008Rr-IO for squashfs-devel@lists.sourceforge.net;
 Tue, 14 Jan 2025 21:32:30 +0000
Received: from [192.168.178.95] ([82.69.79.175]) by :SMTPAUTH: with ESMTPSA
 id XoDgtGdzwwNr3XoDhtVvgF; Tue, 14 Jan 2025 14:13:05 -0700
X-CMAE-Analysis: v=2.4 cv=L4LnQ/T8 c=1 sm=1 tr=0 ts=6786d361
 a=84ok6UeoqCVsigPHarzEiQ==:117 a=84ok6UeoqCVsigPHarzEiQ==:17
 a=IkcTkHD0fZMA:10 a=JfrnYn6hAAAA:8 a=FXvPX3liAAAA:8 a=ZqW0wvtL_bDeDkRxjCwA:9
 a=QEXdDO2ut3YA:10 a=1CNFftbPRP8L7MoqJWF3:22 a=UObqyxdv-6Yh2QiB9mM_:22
X-SECURESERVER-ACCT: phillip@squashfs.org.uk
Message-ID: <323bd5df-7e80-4056-95a5-516a6d8c0ad0@squashfs.org.uk>
Date: Tue, 14 Jan 2025 21:12:39 +0000
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
To: "Matthew Wilcox (Oracle)" <willy@infradead.org>,
 Andrew Morton <akpm@linux-foundation.org>
References: <20250110163300.3346321-1-willy@infradead.org>
Content-Language: en-US
From: Phillip Lougher <phillip@squashfs.org.uk>
In-Reply-To: <20250110163300.3346321-1-willy@infradead.org>
X-CMAE-Envelope: MS4xfM1KVhj7Y2fal1E4Xrz7tUVNjtaHOFcZHhvZGmffEjBtGS1Ra7N632Ib0bFYCUjNDGrCuLGDov7vvDPT/wWsAbgJ1hgKxdr8v3ZGMHfPA5UkcoTbTfaN
 JaTm04FoqLVkJifgzpfjBqzaffgs/A9xV3T5YM95giAuw7LCy6aUrr9togptThwxB6acHWg7XI0QiFZIEm8WEwkYIQzNUt27VEbJu0xWJ7wO70csvA3Nh4pB
 FVUOgoamRDyMpcTtLAYDn4CHu3hQnUO8N6PPXG230iphiDXFP7atPbvHRJErpdNsg1h7lmGW5klX2phKRitFARZjxiCRyuk7J4ptj22Rv3Q=
X-Spam-Score: 0.0 (/)
X-Spam-Report: Spam detection software,
 running on the system "util-spamd-2.v13.lw.sourceforge.com", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview:  On 1/10/25 16:32, Matthew Wilcox (Oracle) wrote: > We only
 need to assert that the uptodate flag is clear if we're going > to set it.
 This hasn't been a problem before now because we have only > used [...] 
 Content analysis details:   (0.0 points, 6.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 0.0 RCVD_IN_VALIDITY_SAFE_BLOCKED RBL: ADMINISTRATOR NOTICE: The
 query to Validity was blocked.  See
 https://knowledge.validity.com/hc/en-us/articles/20961730681243
 for more information.
 [188.121.53.21 listed in sa-trusted.bondedsender.org]
 0.0 RCVD_IN_VALIDITY_RPBL_BLOCKED RBL: ADMINISTRATOR NOTICE: The
 query to Validity was blocked.  See
 https://knowledge.validity.com/hc/en-us/articles/20961730681243
 for more information.
 [188.121.53.21 listed in bl.score.senderscore.com]
 -0.0 SPF_HELO_PASS          SPF: HELO matches SPF record
 -0.0 SPF_PASS               SPF: sender matches SPF record
X-Headers-End: 1tXoWT-0008Rr-IO
Subject: Re: [Squashfs-devel] [PATCH 1/2] mm: Fix assertion in
 folio_end_read()
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
Cc: linux-fsdevel@vger.kernel.org, squashfs-devel@lists.sourceforge.net
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: squashfs-devel-bounces@lists.sourceforge.net



On 1/10/25 16:32, Matthew Wilcox (Oracle) wrote:
> We only need to assert that the uptodate flag is clear if we're going
> to set it.  This hasn't been a problem before now because we have only
> used folio_end_read() when completing with an error, but it's convenient
> to use it in squashfs if we discover the folio is already uptodate.
> 
> Signed-off-by: Matthew Wilcox (Oracle) <willy@infradead.org>

Reviewed-by: Phillip Lougher <phillip@squashfs.org.uk>
Tested-by: Phillip Lougher <phillip@squashfs.org.uk>

> ---
>   mm/filemap.c | 2 +-
>   1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/mm/filemap.c b/mm/filemap.c
> index 12ba297bb85e..3b1eefa9aab8 100644
> --- a/mm/filemap.c
> +++ b/mm/filemap.c
> @@ -1505,7 +1505,7 @@ void folio_end_read(struct folio *folio, bool success)
>   	/* Must be in bottom byte for x86 to work */
>   	BUILD_BUG_ON(PG_uptodate > 7);
>   	VM_BUG_ON_FOLIO(!folio_test_locked(folio), folio);
> -	VM_BUG_ON_FOLIO(folio_test_uptodate(folio), folio);
> +	VM_BUG_ON_FOLIO(success && folio_test_uptodate(folio), folio);
>   
>   	if (likely(success))
>   		mask |= 1 << PG_uptodate;


_______________________________________________
Squashfs-devel mailing list
Squashfs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/squashfs-devel
